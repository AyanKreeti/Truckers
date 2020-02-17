Rails.application.routes.draw do
  root 'orders#index'

  resources :orders
  
  resources :schedules

  resources :deliveries
  
  namespace :api, format: :json do
    resources :schedules, only: [] do
      get 'current_schedule', on: :collection
    end
  end

  get 'truckers/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
