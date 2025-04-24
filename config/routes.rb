Rails.application.routes.draw do
  devise_for :users

  resources :modalities do
    resources :courses, shallow: true, except: [:index] do
      resources :media, shallow: true
    end
  end

  resources :courses, only: [:index]

  authenticated :user do
    root "home_pages#home_on", as: :home
  end

  unauthenticated do
    root "home_pages#home_off"
  end
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
