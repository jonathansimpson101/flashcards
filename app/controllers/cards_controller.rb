class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user
    if @card.valid?
      @card.save
      Topic.create(deck_id: params[:deck_id], card_id: @card.id)
    else
      render 'new'
    end
  end

  def show
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:id])
    @card_attempt = false
    @card.attempt = ""
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)

    redirect_to card_path(@card)
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to card_path
  end

  private

  def card_params
    params.require(:card).permit(:question, :answer)
  end
end
