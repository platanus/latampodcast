Rails.application.routes.draw do
  devise_for :users
  get '/podcasts/new' => 'podcasts#new'
  post '/podcasts/create' => 'podcasts#create'
  root 'home#index'
end
