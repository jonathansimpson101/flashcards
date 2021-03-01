class AddScoreToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :score, :integer
  end
end
