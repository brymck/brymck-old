Brymck::Application.routes.draw do
  match "about" => "page#about"
  match "/auth/:provider" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  root :to => "page#home"
end
