class DecksController < ApplicationController
  def show
    @deck = Deck.find(params[:id])
    @deck_cards = @deck.cards
  end

  def index
    @decks = Deck.all
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(strong_params)
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

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(strong_params)
    @deck.user = current_user
    @deck.save
    redirect_to deck_path(@deck)
  end

  def index
  end

  def results
    @deck = Deck.find(params[:id])
  end


  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update!(strong_params)
    redirect_to deck_path(@deck)
  end

  private

  def strong_params
    params.require(:deck).permit(:name, :category_id)
  end
end
