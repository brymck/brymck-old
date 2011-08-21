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

    match "subscribe" => "subscribers#new"
    match "unsubscribe/:id/:hash" => "subscribers#unsubscribe", as: :unsubscribe
    resources :subscribers, except: :new do
      member do
        put :activate
        put :deactivate
        put :approve
      end
      match "environment/:env" => "subscribers#environment", as: :environment, on: :collection
    end

    # Generic resources
    resources :apartments, :code, :comments, :locations, :neighborhoods, :tags

    # Post resources
    resources :posts do
      get :preview, on: :collection
      member do
        put :publish
        match "mail_preview/:subscriber_id" => "posts#mail_preview", as: :mail_preview, via: :get
        put :mail
      end
    end
   
    # RSS feed
    match "feed(/:hash)" => "posts#feed", as: :feed

    # Static pages
    match "contact" => "pages#contact"
    match "resume" => "pages#resume"
    match "sitemap" => "pages#sitemap"
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
