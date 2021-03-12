class CardScoresController < ApplicationController
  def create
    @deck = Deck.find(strong_params[:deck_id])
    @score = Score.find_by(deck: @deck, total: nil)
    @score = Score.create!(deck: @deck, user: current_user) unless @score.present?
    CardScore.create!(card_id: strong_params[:card_id].to_i,
                                    score: @score,
                                    correct: strong_params[:correct] == "true")
    authorize @deck
    @score.update(total: @score.card_scores.select(&:correct).size) if strong_params[:final] == "true"
    redirect_to results_deck_path(@deck) if strong_params[:final] == "true"
  end

  private

  def strong_params
    params.permit(:card_id, :deck_id, :correct, :final, :_method, :authenticity_token)
  end
end
