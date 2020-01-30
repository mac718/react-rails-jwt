class WelcomeController < ApplicationController
  #before_action :authenticate_request, only: [:secret]
  def home
    render json: { message: 'Welcome!'}
  end

  def secret
    render json: { secret: 'The secret is potato.'}
  end
end
