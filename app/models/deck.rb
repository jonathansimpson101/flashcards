class Deck < ApplicationRecord
  has_many :topics
  has_many :cards, through: :topics
  has_many :categories
end
