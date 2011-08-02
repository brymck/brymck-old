Brymck::Application.routes.draw do
  scope "(:locale)", :locale => /en|ja/ do
    resources :code, :comments, :languages, :posts

    match "feed" => "posts#feed"

    # Static pages
    match "contact" => "pages#contact"
    match "resume" => "pages#resume"
    match "journal" => "posts#journal", :as => :journal

    # Authentication
    match "login" => "sessions#new", :as => :login
    match "friend" => "sessions#friend", :as => :friend
    match "friend/verify" => "sessions#verify_friend", :as => :verify_friend
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
