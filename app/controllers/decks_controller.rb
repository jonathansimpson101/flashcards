class DecksController < ApplicationController
  def show
    @deck = Deck.find(params[:id])
    @deck_cards = @deck.cards
  end

  def index
    if params[:query].present?
      @decks = Deck.search_by_name(params[:query])
    else
      @decks = Deck.all
    end
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

  def results
    @deck = Deck.find(params[:id])
  end


  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update!(strong_params)
    question_keys = params[:deck][:cards].keys.select { |key| key.match?(/question/) }
    answer_keys = params[:deck][:cards].keys.select { |key| key.match?(/answer/) }
    new_cards = []
    question_keys.each_with_index do | key, index|
      question = "question_#{index + 1}"
      answer = "answer_#{index + 1}"
      new_cards << Card.create(question: params[:deck][:cards][question], answer: params[:deck][:cards][answer])
    end
    cards = params[:deck][:card_ids].reject(&:blank?).map(&:to_i)
    new_cards = new_cards.select(&:valid?)
    if new_cards.present?
      @deck.cards = Card.where(id: cards) + new_cards
    else
      @deck.cards = Card.where(id: cards)
    end
    redirect_to edit_deck_path(@deck)
  end

  def destroy
    @user = current_user
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to dashboard_path
  end

  private

  def strong_params
    params.require(:deck).permit(:name, :category_id)
  end
end
