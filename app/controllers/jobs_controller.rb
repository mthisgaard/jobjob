require_relative '../services/scrape_jobs_service'
require "open-uri"

class JobsController < ApplicationController
  before_action :set_job, only: [:update, :destroy]

  def index
    @jobs = policy_scope(Job) #getting from all pages
    @pending = @jobs.pending.count
    @applied = @jobs.applied.count
    @interviews = @jobs.interview.count
    @rejected = @jobs.rejected.count
    @offers = @jobs.offer.count

    # Job funnel data
    @all_jobs = @jobs.count
    @applied_jobs = @all_jobs - @pending
    @interview_jobs = @interviews + @offers + @rejected

    @status = ["All jobs", "Applied", "Interview", "Offer"]
    @values = [@all_jobs, @applied_jobs, @interview_jobs, @offers]

    @data_value = {
      "labels": @status,
      "datasets": [{
        "label": "Total",
        "backgroundColor": [
          'rgba(211, 243, 238, 0.8)',
          'rgba(104, 225, 253, 0.8)',
          'rgba(250, 250, 55, 0.8)',
          'rgba(172, 255, 89, 0.8)'
        ],
        "borderColor": [
          'rgba(211, 243, 238, 1)',
          'rgba(104, 225, 253, 1)',
          'rgba(250, 250, 55, 1)',
          'rgb(172, 255, 89, 1)'
        ],
        'borderWidth': 1,
        "data": @values
      }]

    }.to_json

    if params[:status].present?
      @status_count = policy_scope(Job.where(status: params[:status])).count
      @pagy, @jobs_p = pagy(policy_scope(Job.where(status: params[:status]).order(created_at: :desc)), items: 4)
      # @jobs_p = policy_scope(Job.where(status: params[:status]))
    else
      @pagy, @jobs_p = pagy(policy_scope(Job).order(created_at: :desc), items: 4)
      @status_count = @jobs.count
    end

    @new_job = Job.new
    @new_task = Task.new
    @job_suggestions = ScrapeJobsService.new.call unless request.format.symbol == :text
    authorize @jobs

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'jobs/filter_jobs', locals: { jobs: @jobs_p }, formats: [:html] }
    end
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    authorize @job

    # file = URI.open(@job.logo_url)              #possible to save logos on cloudinary
    # @job.company_logo.attach(io: file, filename: "nes.png", content_type: "image/png")

   if job_params[:url].present?
     grover = Grover.new(job_params[:url], format: 'A4')
     pdf = grover.to_pdf
     @job.job_posting.attach(io: StringIO.new(pdf), filename: job_params[:company], content_type: "application/pdf")
   end
    if @job.save
      ['Research the company', 'Write cover letter'].each do |task|
        Task.create(
          job: @job,
          title: task
        )
      end
      redirect_to jobs_path, notice: "Job added to your jobs list!"
    else
      # render "/jobs", status: :unprocessable_entity
      redirect_to jobs_path, alert: "Failed to add job, required info missing!"
      # render :index, status: :unprocessable_entity
    end
  end

  def update
    authorize @job
    job_params[:status] = job_params[:status].to_i

    if job_params[:url].present?
      grover = Grover.new(job_params[:url], format: 'A4')
      pdf = grover.to_pdf
      @job.job_posting.attach(io: StringIO.new(pdf), filename: job_params[:company], content_type: "application/pdf")
    end
    if @job.update(job_params)
      check_badges
      if @job.status == "interview"
      ['Re-read job listing', 'Prepare questions to ask at interview'].each do |task|
        Task.create(
          job: @job,
          title: task
        )
      end
    end
      respond_to do |format|
        format.html { redirect_to jobs_path(status: @job.status),notice: "Job updated!" }
        format.text { render partial: "jobs/note", locals: { job: @job }, formats: [:html] }
      end
    else
      redirect_to jobs_path, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @job
    @job.destroy
    redirect_to jobs_path
  end

  private

  def check_badges
    add_badge_flash(4) if current_user.jobs.where(status: 1).count + current_user.jobs.where(status: 2).count + current_user.jobs.where(status: 3).count + current_user.jobs.where(status: 4).count >= 3 && !current_user.badges.find { |badge| badge.id == 4 }
    add_badge_flash(5) if current_user.jobs.where(status: 1).count + current_user.jobs.where(status: 2).count + current_user.jobs.where(status: 3).count + current_user.jobs.where(status: 4).count >= 10 && !current_user.badges.find { |badge| badge.id == 5 }
    add_badge_flash(6) if current_user.jobs.where(status: 2).count + current_user.jobs.where(status: 2).count + current_user.jobs.where(status: 3).count + current_user.jobs.where(status: 4).count >= 3 && !current_user.badges.find { |badge| badge.id == 6 }
    add_badge_flash(7) if current_user.jobs.where(status: 2).count + current_user.jobs.where(status: 3).count + current_user.jobs.where(status: 4).count >= 10 && !current_user.badges.find { |badge| badge.id == 7 }
    add_badge_flash(8) if current_user.jobs.where(status: 3).count + current_user.jobs.where(status: 3).count >= 1 && !current_user.badges.find { |badge| badge.id == 8 }
  end

  def add_badge_flash(number)
    current_user.add_badge(number)
    flash.now[:notice] = 'New achievement unlocked!'
    current_user.save
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :company, :deadline, :url, :notes, :cv, :cover_letter, :status, :logo_url)
  end
end
