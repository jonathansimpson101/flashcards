class Category < ApplicationRecord
  belongs_to :deck
  validates :name, presence: true, uniqueness: true
end
