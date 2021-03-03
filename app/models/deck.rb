class Deck < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :scores
  has_many :topics
  has_many :cards, through: :topics

  validates :name, presence: true, uniqueness: true


  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: :name,
    using: {
      tsearch: { prefix: true }
    }

end
