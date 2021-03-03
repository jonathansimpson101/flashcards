class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]

  def home
  end

  def dashboard
    user = current_user
    @decks = user.decks
    @first_six_decks = Deck.all.shuffle
  end
end
