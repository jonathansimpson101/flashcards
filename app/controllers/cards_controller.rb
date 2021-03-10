class CardsController < ApplicationController
  before_action :set_card, only: [:edit, :update, :destroy]
  before_action :set_deck, only: [:show, :create]

  def index
    @cards = policy_scope(Card)
    if params[:query].present?
      @cards = Card.where(user_id: current_user.id)
      @my_cards = @cards.search_by_question(params[:query])
    else
      @my_cards = Card.where(user_id: current_user.id)
    end
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    authorize @card
    @card.user_id = current_user.id
    if @card.save
      Topic.create(deck_id: @deck.id, card_id: @card.id)
      redirect_to create_new_deck_cards_deck_path(@deck)
    else
      render 'new'
    end
  end

  def show
    @card = @deck.cards.first
    authorize @card
  end

  def edit
  end

  def update
    @card.update(card_params)
    redirect_to cards_path
  end

  def destroy
    @card.destroy
    index
    if @cards.nil?
      redirect_to dashboard_path
    else
      redirect_to cards_path
    end
  end

  private

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def set_card
    @card = Card.find(params[:id])
    authorize @card
  end

  def card_params
    params.require(:card).permit(:question, :answer)
  end
end
