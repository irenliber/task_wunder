Rails.application.routes.draw do
  root to: 'homes#index'

  devise_for :users

  namespace :admin do
    resources :users do
      member do
        get :send_pdf
      end
    end
  end
end
