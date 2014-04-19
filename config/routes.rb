Escrow::Application.routes.draw do
  devise_for :users
  get 'welcome/index'
  #get 'articles/new'

  resources :articles do
    put :bet_yes, :on => :collection
  end

  root 'welcome#index'
end