class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    user = current_user
    @decks = user.decks
    @first_six_decks = Deck.all.first(6)
  end
end
