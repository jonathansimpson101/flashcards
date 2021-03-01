class Deck < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :scores
  has_many :topics
  has_many :cards, through: :topics

  validates :name, presence: true, uniqueness: true
end
