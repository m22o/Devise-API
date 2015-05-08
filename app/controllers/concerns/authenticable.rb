module Authenticable

  # Devise methods overwrites
  def current_user
    # @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
    @current_user ||= ApiKey.find_by(token: request.headers['Authorization'])
  end
end