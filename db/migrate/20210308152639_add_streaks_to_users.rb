class AddStreaksToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :streaks, :integer, default: 0, null: false
  end
end
