Venuekick::Application.routes.draw do
  root to: "map#index"

  get '/map/index' => "map#index"
  get '/map/show' => "map#show"
  post '/map/show' => "map#show"
  get '/map/show/:venue_id' => "map#showid"
  
  get '/save/:id' => "profile#create"  
  get '/destroy/:id' => "profile#destroy"
  get '/profile' => "profile#index"
  get '/about' => "users#about"
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
end
