Brymck::Application.routes.draw do
  scope "(:locale)", :locale => /en|ja/ do
    resources :users
    resources :posts
    resources :comments
    resources :code

    # Static pages
    match "about" => "pages#about"

    match "/login" => "sessions#new", :as => :login
  end

  # Authentication
  match "/auth/:provider/callback" => "sessions#create", :as => :auth
  match "/auth/failure" => "sessions#failure"
  match "/logout" => "sessions#destroy", :as => :logout

  # Default path for each language
  match '/:locale' => 'posts#home', :as => :home

  # Redirects to appropriate home path
  root :to => "pages#root"
end
