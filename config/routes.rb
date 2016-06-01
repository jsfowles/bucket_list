Rails.application.routes.draw do
  get 'users/dashboard'

  root 'static_pages#dashboard'
  devise_for :users

  #RESOURCES

  resources :users
  resources :lists do
    resources :items
  end
end
