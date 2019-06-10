class AddHashCashToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hash_cash, :boolean
  end
end
