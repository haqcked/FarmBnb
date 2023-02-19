Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :animals do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:edit, :update]
  resources :users, only: [:show]
  # create the category files in the seed

  # , only: [:index, :show, :book, :create, :edit, :update, :destroy]

end
