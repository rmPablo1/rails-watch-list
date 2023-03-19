Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "lists#home"
  get "/mylists", to: "pages#home", as: :mylists
  resources :lists, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :bookmarks, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:destroy]
  resources :bookmarks, only: [:destroy]

end
