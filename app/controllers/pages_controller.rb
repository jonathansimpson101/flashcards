class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]

  def home
  end

  def dashboard
    @decks = Deck.all
    @first_six_decks = Deck.first(6)
    @user = current_user
  end
end
