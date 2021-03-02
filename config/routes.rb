Rails.application.routes.draw do
  get 'decks/new'
  get 'decks/edit'
  get 'decks/index'
  get 'decks/results'
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: "pages#dashboard"
  resources :decks do
    resources :cards, only: [:new, :create, :show]
    member do
      get :results
      get :create_new_deck_cards
    end
  end
  resources :cards, only: [:edit, :update, :destroy]
end
