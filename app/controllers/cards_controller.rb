class CardsController < ApplicationController
  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id
    @deck = Deck.find(params[:deck_id])
    if @card.save
      Topic.create(deck_id: @deck.id, card_id: @card.id)
      redirect_to create_new_deck_cards_deck_path(@deck)
    else
      render 'new'
    end
  end

  def show
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)

    redirect_to cards_path
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    does_user_have_card = Card.where(user: current_user)
    if does_user_have_card[0].nil?
      redirect_to dashboard_path
    else
      redirect_to cards_path
    end
  end

  def index
    @cards = Card.where(user: current_user)
  end

  private

  def card_params
    params.require(:card).permit(:question, :answer)
  end
end
