class ApplicationController < ActionController::API
  include ActionController::Cookies
  #before_action :authenticate_request
    attr_reader :current_user

  def authenticate_request
    @current_user = authorize_api_request
    if @current_user
      render json: {current_user: true}
    else 
      render json: {error: 'Not Authorized', current_user: false}, status: 401
    end
  end

  private

  def authorize_api_request
    user()
  end

  def user
    @user ||= User.find(decoded_auth_token[0][0]['user_id']) if decoded_auth_token
    @user || 'Nar'
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_cookie)
  end

  def http_auth_cookie
    if cookies.encrypted[:JWT_token]
      return cookies.encrypted[:JWT_token]
    else 
      puts('Invalid Creds')
    end
  end
end
