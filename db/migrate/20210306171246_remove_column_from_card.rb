class RemoveColumnFromCard < ActiveRecord::Migration[6.1]
  def change
    remove_column :cards, :attempt
  end
end
