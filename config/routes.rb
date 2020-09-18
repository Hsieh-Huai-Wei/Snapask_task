Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount CourseList::Base => '/'
  mount ProfileList::Base => '/'
  
  namespace :admin do
    resources :courses
  end

  namespace :courses do
    resources :courses
  end
  
  resources :profiles
  resources :availables
  resources :languages
  resources :maths

  resources :courses do
    member do
      post :purchase_course
    end
  end
  
  root 'courses#index'
end