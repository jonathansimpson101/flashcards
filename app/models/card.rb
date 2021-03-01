class Card < ApplicationRecord
  has_many :topics
  has_many :decks, through: :topics
end
