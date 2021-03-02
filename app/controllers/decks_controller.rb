class DecksController < ApplicationController
  def show
    @deck = Deck.find(params[:id])
    @deck_cards = @deck.cards
  end


  def index
    @decks = Deck.all

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    if @deck.save
      redirect_to create_new_deck_cards_deck_path(@deck)
    else
      render 'new'
    end
  end

  def create_new_deck_cards
    @deck = Deck.find(params[:id])
    @card = Card.new
    @deck_cards = @deck.cards
  end

  def edit
  end

  def index
  end

  def results
    @deck = Deck.find(params[:id])
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :category_id)
  end
end
