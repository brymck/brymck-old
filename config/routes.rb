Brymck::Application.routes.draw do
  scope "(:locale)", :locale => /en|ja/ do
    # Languages (must come before resources :code)
    scope "/code" do
      resources :languages
    end

    # Generic resources
    resources :code, :comments

    # Post resources
    resources :posts do
      member do
        put :publish
      end
    end

    # RSS feed
    match "feed(/:hash)" => "posts#feed", as: :feed

    # Static pages
    match "resume" => "pages#resume"
    match "sitemap" => "pages#sitemap"
    match "journal" => "posts#journal"

    # Authentication
    match "login" => "sessions#new"
    match "friend" => "sessions#friend"
    match "logout" => "sessions#destroy"
    match "friend/verify" => "sessions#verify_friend", as: :verify_friend
  end

  # Default path for each locale
  match '/:locale' => 'posts#home', as: :home

  # Redirects to appropriate home path
  root :to => "pages#root"
end
