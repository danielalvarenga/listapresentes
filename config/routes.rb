# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  mount Ckeditor::Engine => '/ckeditor'

  resources :mensagens do
    get 'aprovar'
    get 'desaprovar'
  end

  resources :presentes do
    get 'checkout'
  end

  resources :listas do
    collection do
      post 'busca'
      get 'todas'
    end
  end

  resources :nokogiri do
    collection do
      post 'extrair_imagens'
    end
  end

  get "home/index"
  devise_for :users

  # Keep in last line unmatched route
  match '*unmatched', to: 'application#route_not_found', via: :all
end
