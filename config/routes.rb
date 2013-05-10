Neverbuilds::Application.routes.draw do
  opinio_model

  resources :builds do
    opinio
    collection do
      post :pick
      get :pick
    end
  end

  get "logout" => "sessions#destroy", :as => "logout"

  resources :users
  resources :sessions

  root :to => 'builds#index'
end
