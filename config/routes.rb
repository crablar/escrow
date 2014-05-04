Escrow::Application.routes.draw do

  resources :bets

  devise_for :users
  #get 'articles/new'

  post 'articles/check_expiration_all'
  post 'articles/evaluate_user_bets'
  get 'articles/get_user_balance'

  resources :articles do
    post :bet_yes
    post :bet_no
  end

  resources :leaderboards do
    get :index
  end

  get 'welcome/index'

  root 'articles#index'
end