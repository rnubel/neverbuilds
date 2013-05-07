Neverbuilds::Application.routes.draw do
  opinio_model

  resources :builds do
    opinio
    member do
      get :select
      get :reload_comments
      post :rate
      get :save
    end
  end

  get "logout" => "sessions#destroy", :as => "logout"

  resources :users
  resources :sessions

  root :to => 'builds#index'
end
