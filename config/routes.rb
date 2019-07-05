Rails.application.routes.draw do

  root 'events#index'
  resources :events

  #static_pages
  get "/about" , to: 'static_pages#about'
  get "/contact", to: 'static_pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
