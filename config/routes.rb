Rails.application.routes.draw do
  resources :sections
  resources :templates, only: %i[new create index]
  resources :to_do_lists do
    post :create_from_template, on: :collection
    resources :sections do
      resources :tasks
    end
  end
  root to: "dashboard#index" 

  devise_for :users
end
