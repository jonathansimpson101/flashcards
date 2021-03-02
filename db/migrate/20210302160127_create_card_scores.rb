class CreateCardScores < ActiveRecord::Migration[6.1]
  def change
    create_table :card_scores do |t|
      t.boolean :correct
      t.references :scores, null: false, foreign_key: true
      t.references :cards, null: false, foreign_key: true

      t.timestamps
    end
  end
end
