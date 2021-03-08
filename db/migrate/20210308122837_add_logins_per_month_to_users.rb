class AddLoginsPerMonthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :logins_per_month, :integer, null: false, default: 0
  end
end
