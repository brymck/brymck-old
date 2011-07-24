Brymck::Application.routes.draw do
  resources :posts

  resources :users

  match "about" => "page#about"

  match "/auth/:provider/callback" => "sessions#create"
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy", :as => :signout

  root :to => "page#home"
end
