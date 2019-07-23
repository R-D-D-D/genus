Rails.application.routes.draw do
  root 'static_pages#home'

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
  get "/contact", to: 'static_pages#contact'

end
