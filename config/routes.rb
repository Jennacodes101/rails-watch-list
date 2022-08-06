Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
  resources :movies, only: [:new, :create]
  resources :bookmarks, only: :destroy

  get '/profile/:id', to: 'pages#profile', as: 'profile'
end
