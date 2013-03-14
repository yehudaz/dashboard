Dashboard::Application.routes.draw do

  devise_for :users

  resources :records

  resources :versions

  get 'close_version', to: "versions#close", as: "close_version"

  root :to => 'versions#new'

end
