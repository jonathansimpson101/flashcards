class Deck < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :scores, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :cards, through: :topics

  validates :name, presence: true, uniqueness: { scope: :category }
  validates :category, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [:name],
    associated_against: { cards: :question },
    using: { tsearch: { prefix: true } }

  def add_decks_studied_per_month
    if (Date.now = Date.today.at_beginning_of_month)
      self.add_decks_studied_per_month = sign_in_count
    else
      self.add_decks_studied_per_month = 0
    end
  end
end
