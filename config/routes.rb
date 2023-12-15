Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/tables/place', to: 'tables#place'
  post '/tables/move', to: 'tables#move'
  post '/tables/turn_right', to: 'tables#turn_right'
  post '/tables/turn_left', to: 'tables#turn_left'
  post '/tables/report', to: 'tables#report'

  root "tables#index"
end
