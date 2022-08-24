class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def create
    @job = Job.find(params[:job_id])
    @task = Task.new(task_params)
    @task.job = @job
    authorize @task
    if @task.save
      respond_to do |format|
        format.html
        format.text do
          render partial: "jobs/tasks",
                 locals: { job: @job },
                 formats: [:html]
        end
      end
    else
      render "/jobs", status: :unprocessable_entity
    end
  end

  def update
    authorize @task
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to jobs_path
    else
      render "/jobs", status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :done)
  end
end
