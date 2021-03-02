class DecksController < ApplicationController
  def show
    @deck = Deck.find(params[:id])
    @deck_cards = @deck.cards
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    @deck.user = current_user
    raise
    if @deck.save
      redirect_to new_deck_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  def index
    
  end

  def results
    
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :category_id)
  end
end
