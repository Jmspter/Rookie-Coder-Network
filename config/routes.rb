Rails.application.routes.draw do
  resources :courses, only: [:index, :show]
  resources :lessons do
    post :unlock_next, on: :member
  end
  
  resources :articles
  devise_for :users
  root "static_pages#home"
  get "/about" => "static_pages#about"

  get 'quiz/question', to: 'quiz#question'
  post 'quiz/answer', to: 'quiz#answer'
  get 'quiz/result', to: 'quiz#result'

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
