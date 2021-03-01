class AddReferencesToDecks < ActiveRecord::Migration[6.1]
  def change
    add_column :decks, :name, :string
    add_reference :decks, :user, null: false, foreign_key: true
    add_reference :decks, :category, null: false, foreign_key: true
  end
end
