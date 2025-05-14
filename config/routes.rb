Rails.application.routes.draw do
  resources :articles, only: [:new, :create, :edit, :update, :destroy]
  #Pagina Sobre
  get 'sobre' => "home_pages#about", as: :about

  #Politicas de privacidade
  get 'politicas-de-privacidade' => "home_pages#privacy_policy", as: :privacy_policy

  #Termos de uso
  get 'termos-de-uso' => "home_pages#terms_of_use", as: :terms_of_use

  #Favoritar curso
  get 'favorites', to: 'courses#favorites', as: 'favorites'

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
    resource :favorite, only: [:create, :destroy]
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
