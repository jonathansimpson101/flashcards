class AddUserToCards < ActiveRecord::Migration[6.1]
  def change
    add_reference :cards, :user, foreign_key: true
  end
end
