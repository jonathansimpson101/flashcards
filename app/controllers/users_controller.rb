class UsersController < ApplicationController
  before_action :set_user

  def decks
    @decks = @user.decks
  end

  def scores
    @scores = @user.scores
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
