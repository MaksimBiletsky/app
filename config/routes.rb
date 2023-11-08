Rails.application.routes.draw do
  resources :sections
  resources :to_do_lists do
    resources :sections do
      resources :tasks
    end
  end
  root to: "dashboard#index" 

  devise_for :users
end
