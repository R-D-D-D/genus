Rails.application.routes.draw do

  root 'events#index'

  resources :events do
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
  get "/contact", to: 'static_pages#contact'

end
