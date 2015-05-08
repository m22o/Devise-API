class Api::V1::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create ]
  skip_before_filter :verify_signed_out_user
  skip_before_filter :verify_authenticity_token

  def create
    if signed_in?
      render json: {errors: "User already logged in" }
    else
      user_password = params[:user][:password]
      user_email = params[:user][:email]
      user = user_email.present? && User.find_by(email: user_email)

      if user.valid_password? user_password
        sign_in user, :bypass => true 
        user.generate_authentication_token!
        user.save
        render json: {record: user,api_key: user.api_key}#, status: 200#, location: [:api, user]
      else
        render json: { errors: "Invalid email or password" }, status: 422
      end
    end
  end

  def destroy
    current_user.api_key.destroy!
    # head 204
  end

  private

  def signed_in?
    User.find_by_email(params[:user][:email]).api_key
  end
end
