Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, except: [:index]
resources :posts
resources :friendship
root 'posts#index'
resources :users, :only => [:show]
end
