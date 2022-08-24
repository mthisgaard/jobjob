class JobsController < ApplicationController

  def index
    @jobs = policy_scope(Job)
    @job = Job.new
    authorize @jobs
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    authorize @job
    if @job.save
      redirect_to jobs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @job = Job.find(params[:id])
    authorize @job
    if @job.update(job_params)
      redirect_to jobs_path
    else
      redirect_to jobs_path, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company, :deadline, :url, :notes, :cv, :cover_letter)
  end
end
