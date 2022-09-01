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
        UserChannel.broadcast_to(
          @user,
          "New email from #{@job.company}"
        )
        head :ok
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
