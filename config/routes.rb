Dashboard::Application.routes.draw do

  resources :records
  get 'dashboard(/:type)' => 'dashboard#index', as: 'dashboard'

  root :to => 'dashboard#index'
end
