Rails.application.routes.draw do
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only:[:create]
  resources :registrations, only:[:create]
  

  # events
  get '/events/front' => 'events#front', as: :manage_posts
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

  #resources :messages
  resources :messages, :path => "contact_us"

  #static_pages
  get "/about" , to: 'static_pages#about'
  get "/join_us", to: 'static_pages#join_us'

  #sessions
  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#logout'
  get "sessions/status"

  #registrations
  get "/signup", to: 'registrations#new'
  post "/signup", to: 'registrations#create'

  #search_page
  get '/search', to: 'search_page#search'

end
