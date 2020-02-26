Rails.application.routes.draw do
  root 'deliveries#new'

  resources :truckers

  resources :orders
  
  resources :schedules

  resources :deliveries
  
  namespace :api, format: :json do
    resources :schedules, only: [] do
      get 'current_schedule', on: :collection
    end
    resources :deliveries, only: [] do
      get 'schedule_orders', on: :collection

      patch 'update_order_status', on: :collection
    end
    resources :truckers, only: [] do
      get 'truckers_list', on: :collection
    end
  end

  get 'truckers/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
