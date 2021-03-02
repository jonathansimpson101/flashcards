class DecksController < ApplicationController
  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update(strong_params)
    redirect_to decks_path
  end

  private

  def strong_params
    params.require(:decks).permit(:name, :user_id, :category_id)
  end
end
