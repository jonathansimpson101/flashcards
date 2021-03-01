class Category < ApplicationRecord
  has_many :decks
  validates :name, presence: true, uniqueness: true
end
