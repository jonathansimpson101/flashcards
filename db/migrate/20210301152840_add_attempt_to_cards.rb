class AddAttemptToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :attempt, :string
  end
end
