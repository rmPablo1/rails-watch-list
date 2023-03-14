Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "lists#home"
  resources :lists, only: [:show, :new, :create] do
    resources :bookmarks, only: [:create]
    resources :reviews, only: [:create]
  end

  resources :bookmarks, only: [:destroy]

end
