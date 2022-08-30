require_relative '../services/scrape_jobs_service'

class JobsController < ApplicationController
  before_action :set_job, only: [:update, :destroy]

  def index
    @jobs = policy_scope(Job) #getting from all pages
    @pending = @jobs.filter { |job| job.pending? }.count
    @applied = @jobs.filter { |job| job.applied? }.count
    @interviews = @jobs.filter { |job| job.interview? }.count
    @rejected = @jobs.filter { |job| job.rejected? }.count
    @offers = @jobs.filter { |job| job.offer? }.count

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
      @pagy, @jobs_p = pagy(policy_scope(Job.where(status: params[:status]).order(created_at: :desc)), items: 5)
      # @jobs_p = policy_scope(Job.where(status: params[:status]))
    else
      @pagy, @jobs_p = pagy(policy_scope(Job), items: 5)
      @status_count = @jobs.count
      # @jobs = policy_scope(Job)
    end

    @new_job = Job.new
    @new_task = Task.new
    @job_suggestions = ScrapeJobsService.new.call
    authorize @jobs
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    ['Research the company', 'Write cover letter'].each do |task|
      Task.create(
        job: @job,
        title: task
      )
    end

    authorize @job
    if job_params[:url].present?
      grover = Grover.new(job_params[:url], format: 'A4')
      pdf = grover.to_pdf
      @job.job_posting.attach(io: StringIO.new(pdf), filename: job_params[:company], content_type: "application/pdf")
    end
    if @job.save
      redirect_to jobs_path
    else
      # render "/jobs", status: :unprocessable_entity
      render :index, status: :unprocessable_entity

    end
  end

  def update
    authorize @job
    if job_params[:url].present?
      grover = Grover.new(job_params[:url], format: 'A4')
      pdf = grover.to_pdf
      @job.job_posting.attach(io: StringIO.new(pdf), filename: job_params[:company], content_type: "application/pdf")
    end
    if @job.update(job_params)
      respond_to do |format|
        format.html { redirect_to jobs_path }
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

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :company, :deadline, :url, :notes, :cv, :cover_letter, :status)
  end
end
