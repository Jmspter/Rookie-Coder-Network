Rails.application.routes.draw do
  # Autenticação com Devise
  devise_for :users

  # Modalidades com cursos e mídias aninhados
  resources :modalities, param: :slug do
    resources :courses, shallow: true, except: [:index] do
      resources :media, shallow: true
    end
  end

  # Cursos: index global + funcionalidades adicionais
  resources :courses do
    member do
      get 'certificate'  
    end
    
    resources :media do
      post 'mark_as_completed', on: :member
    end
  end

  # Certificados: visualização e download
  resources :certificates, only: [:show] do
    get 'download', on: :member
  end

  get 'validate-certificate', to: 'certificates#validate', as: :validate_certificate

  # Root condicional: autenticado e não autenticado
  authenticated :user do
    root "home_pages#home_on", as: :home
  end

  unauthenticated do
    root "home_pages#home_off"
  end

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Arquivos PWA
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Somente no ambiente de desenvolvimento
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
