class JobsController < ApplicationController
  before_action :set_job, only: [:update, :destroy]

  def index
    @jobs = policy_scope(Job)
    @new_job = Job.new
    @new_task = Task.new
    authorize @jobs
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    authorize @job
    grover = Grover.new(job_params[:url], format: 'A4')
    pdf = grover.to_pdf
    @job.job_posting.attach(io: StringIO.new(pdf), filename: job_params[:company], content_type: "application/pdf")
    if @job.save
      redirect_to jobs_path
    else
      render "/jobs", status: :unprocessable_entity
    end
  end

  def update
    authorize @job
    grover = Grover.new(job_params[:url], format: 'A4')
    pdf = grover.to_pdf
    @job.job_posting.attach(io: StringIO.new(pdf), filename: job_params[:company], content_type: "application/pdf")
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
