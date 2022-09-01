class Api::V1::EmailsController < Api::V1::BaseController
  skip_before_action :authenticate_request
  skip_after_action :verify_authorized

  def create
    @user = User.find_by(email: params[:to])
    @job = Job.find_by(contact_email: params[:from], user: @user)
    if @job.present?
      @email = Email.new(email_params)
      @email.job = @job
      @email.user = @user
      if @email.save
        redirect_to jobs_path(status: @job.status), notice: "New email from #{@email.sender} added to #{@job.company}"
      else
        render_error
      end
    end
  end

  private

  def render_error
    render json: { errors: @email.errors.full_messages },
      status: :unprocessable_entity
  end

  def email_params
    params.require(:email).permit(:sender, :from, :to, :subject, :date, :url, :content)
  end
end
