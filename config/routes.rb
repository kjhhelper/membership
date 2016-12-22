Rails.application.routes.draw do
  get '/main'=>'users#new'
  post '/users'=>'users#create'
  post '/sessions'=>'sessions#create'
  delete '/sessions/:id'=>'sessions#destroy'
  # get '/sessions'=>'sessions#destroy'
  get '/groups/new'=>'groups#new'
  post '/groups'=>'groups#create'
  get '/groups/:id'=>'groups#show'

  post '/joins'=>'joins#create'
  delete '/joins/:id'=>'joins#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
