Rails.application.routes.draw do
  resources :faqs
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only:[:create]
  resources :registrations, only:[:create]
  delete :logout, to: "sessions#logout"
  get :login, to: "sessions#new"

  # events
  get '/events/front' => 'events#front', as: :manage_posts
  resources :events do
    member do
      delete :delete_image
    end

  	put 'publish' => 'events#publish',
  	on: :member, as: :publish
  
  	put 'unpublish' => 'events#unpublish', 
  	on: :member, as: :unpublish
  end

  #resources :messages
  resources :messages, :path => "contact_us"

  #static_pages
  get "/about" , to: 'static_pages#about'
  get "/join_us", to: 'static_pages#join_us'

  #sessions
  get "/log_in", to: 'sessions#new'
  post "/log_in", to: 'sessions#create'

  #search_page
  get '/search', to: 'search_page#search'

end
