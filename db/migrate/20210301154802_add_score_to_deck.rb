class AddScoreToDeck < ActiveRecord::Migration[6.1]
  def change
    add_column :decks, :score, :integer
  end
end
