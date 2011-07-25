Brymck::Application.routes.draw do
  scope "(:locale)", :locale => /en|ja/ do
    resources :posts
    resources :users

    match "about" => "page#about"

    match "/auth/:provider/callback" => "sessions#create"
    match "/auth/failure" => "sessions#failure"
    match "/signout" => "sessions#destroy", :as => :signout
  end

  match '/:locale' => 'page#home'
  root :to => "page#home"
end
