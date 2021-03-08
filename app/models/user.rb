class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  before_update :add_streak
  has_many :decks, dependent: :destroy
  has_one_attached :avatar
  has_many :cards, dependent: :destroy
  has_many :scores, dependent: :destroy

  def add_streak
    if (current_sign_in_at - last_sign_in_at) < 86_400
      self.streaks += 1
    end
  end
end
