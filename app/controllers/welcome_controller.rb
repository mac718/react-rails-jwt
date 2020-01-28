class WelcomeController < ApplicationController
  def home
    render json: { message: 'Welcome!'}
  end
end
