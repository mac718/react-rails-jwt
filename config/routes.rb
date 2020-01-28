Rails.application.routes.draw do
  get '/home', to: 'welcome#home'
  get '/secret', to: 'welcome#secret'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/authenticate', to: 'authentication#authenticate_user'
end
