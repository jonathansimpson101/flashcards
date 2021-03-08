class AddStreaksToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :streaks, :integer, null: false, default: 0
  end
end
