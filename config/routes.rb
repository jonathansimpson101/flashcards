Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: "pages#dashboard"
  resources :decks do
    resources :cards, only: [:new, :create, :show]
  end
  resources :decks [] do
    member do
      get :results
    end
  end
  resources :cards, only: [:edit, :update, :destroy]
end
