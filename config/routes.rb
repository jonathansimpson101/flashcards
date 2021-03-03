Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: "pages#dashboard"
  resources :cards,only: [:index, :edit, :update]
  resources :decks do
    resources :cards, only: [:new, :create, :show]
    member do
      get :results
      get :create_new_deck_cards
    end
  end
  resources :cards, only: [:edit, :update, :destroy]
end
