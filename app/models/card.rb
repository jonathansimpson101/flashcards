class Card < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :decks, through: :topics
  has_many :card_scores, dependent: :destroy

  validates :question, presence: true
  validates :answer, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_card_name,
    against: [:name],
    using: { tsearch: { prefix: true }}
end
