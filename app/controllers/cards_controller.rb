class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = card.new(card_params)
    @card.user = current_user
    if @card.valid?
      @card.save
      redirect_to deck_path
    else
      render 'new'
    end
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
    params.require(:card).permit(:question, :answer, :topic)
  end
end
