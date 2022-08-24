class JobsController < ApplicationController

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
    if @job.save
      redirect_to jobs_path
    else
      render "/jobs", status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company, :deadline, :url, :notes, :cv, :cover_letter)
  end
end
