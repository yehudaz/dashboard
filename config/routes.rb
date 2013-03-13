Dashboard::Application.routes.draw do

  devise_for :users

  resources :records

  resources :versions

  root :to => 'versions#new'

end
