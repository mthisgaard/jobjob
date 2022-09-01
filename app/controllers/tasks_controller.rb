class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update]

  def create
    @job = Job.find(params[:job_id])
    @task = Task.new(task_params)
    @task.job = @job
    authorize @task
    if @task.save
      respond_to do |format|
        format.html
        format.text { render partial: "jobs/tasks", locals: { tasks: @job.tasks.order(:done, :created_at) }, formats: [:html] }
      end
    else
      # render partial: "jobs/tasks", status: :unprocessable_entity
      render :index, status: :unprocessable_entity

    end
  end

  def update
    authorize @task
    @user = current_user
    unless @task.update(task_params)
      render partial: "jobs/tasks", status: :unprocessable_entity
    end
    check_badges(@task)
  end

  def destroy
    authorize @task
    @task.destroy
    respond_to do |format|
      format.html
      format.text { render partial: "jobs/tasks", locals: { tasks: @job.tasks.order(:done, :created_at) }, formats: [:html] }
    end
  end

  private

  def check_badges(task)
    current_user.add_badge(1) if task.job.user.tasks.where(done: true).count >= 3 && !current_user.badges.find { |badge| badge.id == 1 }
    current_user.add_badge(2) if task.job.user.tasks.where(done: true).count >= 5 && !current_user.badges.find { |badge| badge.id == 2 }
    # current_user.add_badge(3) if task.job.user.jobs.where(status: 1).any? && !current_user.badges.find { |badge| badge.id == 3 }
    current_user.save
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :done)
  end
end
