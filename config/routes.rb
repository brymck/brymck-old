Brymck::Application.routes.draw do
  scope "(:locale)", :locale => /en|ja/ do
    # Languages (must come before resources :code)
    scope "/code" do
      resources :languages
    end

    scope "/market" do
      match "/" => "portfolios#home", as: :market
      resources :metrics, :portfolios, :quotes, :sources
    end

    # Generic resources
    resources :code, :comments, :locations, :tags

    # Post resources
    resources :posts do
      get :preview, on: :collection
    end
   
    # RSS feed
    match "feed" => "posts#feed"

    # Static pages
    match "contact" => "pages#contact"
    match "resume" => "pages#resume"
    match "journal" => "posts#journal"

    # Authentication
    match "login" => "sessions#new"
    match "friend" => "sessions#friend"
    match "friend/verify" => "sessions#verify_friend", as: :verify_friend
  end

  # Authentication
  match "/auth/:provider/callback" => "sessions#create", as: :auth
  match "/auth/failure" => "sessions#failure"
  match "/logout" => "sessions#destroy"

  # Default path for each locale
  match '/:locale' => 'posts#home', as: :home

  # Redirects to appropriate home path
  root :to => "pages#root"
end
