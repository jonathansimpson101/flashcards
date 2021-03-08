class DecksController < ApplicationController
  before_action :set_deck, except: [:index, :new, :create]

  def show
    @deck_cards = @deck.cards
    authorize @deck_cards
  end

  def index
    @decks = policy_scope(Deck)
    if params[:query].present?
      @decks = Deck.search_by_name(params[:query])
    else
      @decks = Deck.all
    end
  end

  def new
    @deck = Deck.new
    authorize @deck
  end

  def create
    @deck = Deck.new(strong_params)
    authorize @deck
    @deck.user = current_user
    if params[:deck][:category_id].present?
      category = Category.find(params[:deck][:category_id])
    elsif params[:deck][:category][:name].present?
      category = Category.create(name: params[:deck][:category][:name])
    end
    @deck.category = category if category
    if @deck.save
      redirect_to create_new_deck_cards_deck_path(@deck)
    else
      render "new"
    end
  end

  def create_new_deck_cards
    @deck.name = @deck.name.titleize
    @card = Card.new
    @deck_cards = @deck.cards
  end

  def results
  end

  def edit
  end

  def update
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
    @deck.destroy
    redirect_to dashboard_path
  end

  private

  def strong_params
    params.require(:deck).permit(:name)
  end

  def set_deck
    @deck = Deck.find(params[:id])
    authorize @deck
  end
end
