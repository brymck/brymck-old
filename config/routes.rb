Brymck::Application.routes.draw do
  match "about" => "page#about"

  root :to => "page#home"
end
