class Api::V1::JobsController < Api::V1::BaseController
  def index
    @jobs = policy_scope(Job)
  end

  def create
    puts params
    @job = Job.new(job_params)
    # todo hard coding first user for now
    @job.user = current_user
    authorize @job
    if @job.save
      render json: @job
    else
      render_error
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company, :url)
  end

  def render_error
    render json: { errors: @job.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_job
    @job = Job.find(params[:id])
    authorize @restaurant  # For Pundit
  end

end
