class CreateCardScores < ActiveRecord::Migration[6.1]
  def change
    create_table :card_scores do |t|
      t.boolean :correct, default: false
      t.references :score, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
