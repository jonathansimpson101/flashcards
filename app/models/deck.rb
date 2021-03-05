class Deck < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :scores, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :cards, through: :topics

  validates :name, presence: true, uniqueness: {scope: :category}
  validates :category, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [:name],
    associated_against: { cards: :question},
    using: { tsearch: { prefix: true }}
end
