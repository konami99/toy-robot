Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/tables/place', to: 'tables#place'
  post '/tables/move', to: 'tables#move'

  root "tables#index"
end
