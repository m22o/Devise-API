include ActionController::HttpAuthentication::Token::ControllerMethods
include ActionController::MimeResponds
include Authenticable

class ApplicationController < ActionController::API
	private

  def current_user
    @current_user ||=ApiKey.find_by(token: params[:user][:token]).user
  end

  def authenticate_with_token!
    if params[:fields][:email]==current_user.email
      render json: { errors: "Not authenticated" },
      status: :unauthorized unless current_user.present?
    else
      render json: { errors: "Not authenticated" }
    end
  end
end
