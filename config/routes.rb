Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  resources :coins
  root to: 'welcome#index'
end
