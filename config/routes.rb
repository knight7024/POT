Rails.application.routes.draw do
  	devise_for :users
	root :to => redirect('/pots')
  	get '/pots' => 'main#posts', via: [:get]
	get '/pots/post' => 'main#create_matching', via: [:get]
	post '/create' => 'main#create', via: [:post]
	get '/get' => 'main#get_game_posts', via: [:get]
end
