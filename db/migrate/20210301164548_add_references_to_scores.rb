class AddReferencesToScores < ActiveRecord::Migration[6.1]
  def change
    add_reference :scores, :user, null: false, foreign_key: true
    add_reference :scores, :deck, null: false, foreign_key: true
    add_column :scores, :total, :integer
  end
end
