class Score < ApplicationRecord
  belongs_to :deck
  belongs_to :user
  has_many :card_scores
end
