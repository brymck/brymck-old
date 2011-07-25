Brymck::Application.routes.draw do
  scope "(:locale)", :locale => /en|ja/ do
    resources :posts
    resources :users

    match "about" => "page#about"
    match "/signin" => "sessions#new", :as => :signin
  end

  match "/auth/:provider/callback" => "sessions#create", :as => :auth
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy", :as => :signout

  match '/:locale' => 'page#home', :as => :home
  root :to => "page#home"
end
