Escrow::Application.routes.draw do

  resources :bets

  devise_for :users
  #get 'articles/new'

  resources :articles do
    put :bet_yes, :on => :collection
    put :bet_no, :on => :collection
  end

  root 'articles#index'
end