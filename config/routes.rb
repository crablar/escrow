Escrow::Application.routes.draw do
  devise_for :users
  get 'welcome/index'
  #get 'articles/new'

  resources :articles

  root 'welcome#index'
end