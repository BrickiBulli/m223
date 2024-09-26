class EmailLoggerController < ApplicationController
  protect_from_forgery with: :null_session

  def log_email
    email = params[:email]
    Rails.logger.info "Email to be sent: #{email}"

    render json: { message: "Email logged successfully.", email: email }, status: :ok
  end
end
