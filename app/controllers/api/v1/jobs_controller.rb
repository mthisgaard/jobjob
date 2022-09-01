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
    if job_params[:url].present?
      grover = Grover.new(job_params[:url], format: 'A4')
      pdf = grover.to_pdf
      @job.job_posting.attach(io: StringIO.new(pdf), filename: job_params[:company], content_type: "application/pdf")
    end
    if @job.save
      render json: @job
      ['Research the company', 'Write cover letter'].each do |task|
        Task.create(
          job: @job,
          title: task
        )
      end
      redirect_to jobs_path
    else
      render_error
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company, :url, :logo_url, :status)
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
