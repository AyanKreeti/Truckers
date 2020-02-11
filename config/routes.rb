Rails.application.routes.draw do
  root 'orders#index'

  resources :orders do
  end
  
  resources :schedules do
  end

  resources :deliveries do
  end
  
  get 'truckers/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
