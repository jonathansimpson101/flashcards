class CardScore < ApplicationRecord
  belongs_to :score
  belongs_to :card
end
