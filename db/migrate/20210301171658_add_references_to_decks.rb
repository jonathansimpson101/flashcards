class AddReferencesToDecks < ActiveRecord::Migration[6.1]
  def change
    add_reference :decks, :user, null: false, foreign_key: true
    add_reference :decks, :category, null: false, foreign_key: true
    add_column :decks, :name, :string
  end
end
