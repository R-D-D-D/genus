Rails.application.routes.draw do
  resources :upcoming_events
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only:[:create, :new]
  resources :registrations, only:[:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

	# events
  get '/events/front' => 'events#front'
  resources :events do
  	put 'publish' => 'events#publish',
  	on: :member, as: :publish
  
  	put 'unpublish' => 'events#unpublish', 
  	on: :member, as: :unpublish

  	delete '/images/:images_id', 
  	to: 'events#delete_image',
  	as: 'delete_image',
  	on: :member

  	delete '/videos/:videos_id', 
  	to: 'events#delete_video',
  	as: 'delete_video',
  	on: :member
  end

  #static_pages
  get "/about" , to: 'static_pages#about'
  get "/join_us", to: 'static_pages#join_us'

  #sessions
  get "/log_in", to: 'sessions#new'
  post "/log_in", to: 'sessions#create'

  #search_page
  get '/search', to: 'search_page#search'

end
