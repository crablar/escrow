Escrow::Application.routes.draw do

  resources :bets

  devise_for :users
  #get 'articles/new'

  post 'articles/check_expiration_all'
  post 'articles/evaluate_user_bets'
  get 'articles/get_user_balance'

  resources :articles do
    put :bet_yes, :on => :collection
    put :bet_no, :on => :collection
  end

  resources :leaderboards do
    get :index,:on => :collection
  end

  root 'articles#index'
end