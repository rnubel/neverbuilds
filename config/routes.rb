Neverbuilds::Application.routes.draw do
  opinio_model

  resources :builds do
    opinio
    collection do
      post :pick
    end
    member do
      get :reload_comments
    end
  end

  get "logout" => "sessions#destroy", :as => "logout"

  resources :users
  resources :sessions

  root :to => 'builds#index'
end
