class DecksController < ApplicationController

  def index
  end

  def show
    @deck = Deck.find(params[:id])
    @deck_cards = @deck.cards
  end

  def edit
  end
  
end
