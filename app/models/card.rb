class Card < ApplicationRecord
  has_many :topics
  has_many :decks, through: :topics
  has_many :card_scores

  validates :question, presence: true
  validates :attempt, presence: true
  validates :answer, presence: true
end
