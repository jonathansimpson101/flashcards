class CategoryController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(strongParams)
    redirect_to cards_path
  end

  private

  def strongParams
    params.require(:category).permit(:name)
  end

end
