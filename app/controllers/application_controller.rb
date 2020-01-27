class ApplicationController < ActionController::API
  before_action :authenticate_request
    attr_reader :current_user

  private

  def authenticate_request
    @current_user = authorize_api_request(headers)
    render json: {error: 'Not Authorized'}, status: 401 unless @current_user
  end

  def authorize_api_request(headers)
    user(headers)
  end

  def user(headers)
    @user ||= User.find(decoded_auth_token(headers)[:user_id]) if decoded_auth_token
    @user || 'Nar'
  end

  def decode_auth_token(headers)
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header(headers))
  end

  def http_auth_header(headers)
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ')[0]
    else 
      console.error('Invalid Creds')
    end
  end
end
