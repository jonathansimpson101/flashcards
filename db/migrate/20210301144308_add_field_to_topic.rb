class AddFieldToTopic < ActiveRecord::Migration[6.1]
  def change
    add_reference :topics, :card, null: false, foreign_key: true
    add_reference :topics, :deck, null: false, foreign_key: true
  end
end
