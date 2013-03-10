Dashboard::Application.routes.draw do

  devise_for :users

  resources :records

  get 'dashboard(/:the_type)' => 'dashboard#index', as: 'dashboard'

  resources :versions

  root :to => 'versions#new'

end
