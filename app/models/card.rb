class Card < ApplicationRecord
  has_many :topics
  has_many :decks, through: :topics

  validates :question, presence: true
  validates :attempt, presence: true
  validates :answer, presence: true

end
