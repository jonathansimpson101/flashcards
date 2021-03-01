class AddColumnToCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :name, :string
    add_reference :categories, :deck, null: false, foreign_key: true
  end
end
