class AddQuestionToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :question, :string
  end
end
