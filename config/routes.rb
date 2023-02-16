Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :animals do
    resources :booking, only: [:accept, :decline, :edit, :update]
    resources :user, only: [:show] # we are not sure how to nest these
  end

  # , only: [:index, :show, :book, :create, :edit, :update, :destroy]

end
