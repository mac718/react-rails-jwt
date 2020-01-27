class AuthenticationController < ApplicationController
  def authenticate_user(email, password)
    if user(email, password)
      token = JsonWebToken.encode(user_id: user.id)
      render json: {auth_token: token}
    else 
      render json: {error: 'Invalid credentials'}
  end

  private

  def user(email, password)
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)
  end
end
