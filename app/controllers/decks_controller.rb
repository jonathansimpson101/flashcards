class DecksController < ApplicationController

  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
    @deck_cards = @deck.cards
  end

  def edit
  end

  def results
    @deck = Deck.find(params[:id])
  end

end
