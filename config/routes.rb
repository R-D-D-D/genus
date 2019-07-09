Rails.application.routes.draw do

  root 'events#index'
  resources :events do
  	member do
  		delete :delete_image
  	end
  end

  #static_pages
  get "/about" , to: 'static_pages#about'
  get "/contact", to: 'static_pages#contact'

end
