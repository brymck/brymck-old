Brymck::Application.routes.draw do
  scope "(:locale)", :locale => /en|ja/ do
    resources :users
    resources :posts
    resources :comments

    # Static pages
    match "about" => "page#about"

    match "/signin" => "sessions#new", :as => :signin
  end

  # Authentication
  match "/auth/:provider/callback" => "sessions#create", :as => :auth
  match "/auth/failure" => "sessions#failure"
  match "/signout" => "sessions#destroy", :as => :signout

  # Default path for each language
  match '/:locale' => 'page#home', :as => :home

  # Redirects to appropriate home path
  root :to => "page#root"
end
