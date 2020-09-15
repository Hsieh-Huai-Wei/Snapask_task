Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    resources :courses
  end
  resources :courses
  
  resources :profiles
  
  resources :courses do
    member do
      post :purchase_course
    end
  end

  root 'courses#index'
end
