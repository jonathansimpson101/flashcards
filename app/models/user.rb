class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  before_update :add_streak, :add_logins_per_month
  has_many :decks, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :scores, dependent: :destroy

  def decks_studied_per_month
    scores.where("created_at between ? and  ?", Date.today.at_beginning_of_month, Date.today + 1.day).count
  end

  def add_streak
    if last_sign_in_at.beginning_of_day == current_sign_in_at.beginning_of_day
      # last sign in within a day therefore, no streak added
    elsif last_sign_in_at.beginning_of_day == current_sign_in_at.yesterday.beginning_of_day
      # last sign in is more than 24 hours but less than 48 hours therefore, adds a streak
      self.streaks += 1
    else
      # sign-in was more than 48 hours ago therefore, reset streak to 0
      self.streaks = 0
    end
  end

  def add_logins_per_month
    if (Date.today == Date.today.at_beginning_of_month)
      self.logins_per_month = 0
      self.sign_in_count = 0
    else
      self.logins_per_month = sign_in_count
    end
  end
end
