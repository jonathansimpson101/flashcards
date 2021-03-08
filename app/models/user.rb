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
    if (current_sign_in_at - 86_400) <= last_sign_in_at
      # last sign in within a day therefore, no streak added
    elsif (current_sign_in_at - 86_400) >= last_sign_in_at && (current_sign_in_at - 172_800) <= last_sign_in_at
      # last sign in is more than 24 hours but less than 48 hours therefore, adds a streak
      self.streaks += 1
    else
      # sign-in was more than 48 hours ago therefore, reset streak to 0
      self.streaks = 0
    end
  end

  def add_logins_per_month
    if (Date.now = Date.today.at_beginning_of_month)
      self.logins_per_month = sign_in_count
    else
      self.logins_per_month = 0
    end
  end

  def decks_studied_per_month
    scores.where("created_at between ? and  ?", Date.today.at_beginning_of_month, Date.today + 1.day).count
  end
end
