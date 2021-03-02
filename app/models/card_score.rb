class CardScore < ApplicationRecord
  belongs_to :scores
  belongs_to :cards
end
