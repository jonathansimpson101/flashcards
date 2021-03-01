class AddAnswerToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :answer, :string
  end
end
