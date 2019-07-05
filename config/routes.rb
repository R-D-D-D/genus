Rails.application.routes.draw do

  root 'events#index'
  resources :events

  #static_pages
  get "/about" , to: 'static_pages#about'
  get "/contact", to: 'static_pages#contact'

end
