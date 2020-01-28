class WelcomeController < ApplicationController
  def home
    render json: { message: 'Welcome!'}
  end

  def secret
    render json: { secret: 'The secret is potato.'}
  end
end
