class AddBalanceToUser < ActiveRecord::Migration
  def change
    add_column :users, :balance, :double
  end
end
