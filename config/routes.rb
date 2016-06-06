Rails.application.routes.draw do

  root 'static_pages#dashboard'
  devise_for :users
  mount Commontator::Engine => '/commontator'
  #RESOURCES

  resources :users
  resources :lists do
    resources :items
  end

  #POST

  post '/remove_image', to: 'items#remove_image'
end
