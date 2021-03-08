class AddLoginsPerMonthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :logins_per_month, :integer, default: 0, null: false
  end
end
