class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def create
    @task = Task.new(task_params)
    @job = Job.find(params[])
    @task.job = @job
    @task.user = current_user
    authorize @task
    if @task.save
      redirect_to jobs_path
    else
      render , status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
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
