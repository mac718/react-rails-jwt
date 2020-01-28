class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  def authenticate_user
    email = params[:email]
    password = params[:password]
    if find_user(email, password)
      token = JsonWebToken.encode(user_id: find_user(email, password).id)
      render json: {auth_token: token}
    else 
      render json: {error: 'Invalid credentials'}
    end
  end

  private

  def find_user(email, password)
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)
  end
end
