Escrow::Application.routes.draw do

  resources :bets

  devise_for :users
  #get 'articles/new'

  post 'articles/check_expiration_all'
  get 'articles/get_user_balance'

  resources :articles do
    put :bet_yes, :on => :collection
    put :bet_no, :on => :collection
  end

  root 'articles#index'
end