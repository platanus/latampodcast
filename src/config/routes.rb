Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get '/podcasts/new' => 'podcasts#new'
  post '/podcasts/create' => 'podcasts#create'
end
