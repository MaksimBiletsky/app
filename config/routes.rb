Rails.application.routes.draw do
  resources :to_do_lists
  root to: "dashboard#index" 

  devise_for :users
end
