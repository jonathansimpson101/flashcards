class Card < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :decks, through: :topics
  has_many :card_scores, dependent: :destroy

  validates :question, presence: true
  validates :answer, presence: true
end
