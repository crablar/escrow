class CreateBetDefault < ActiveRecord::Migration
  def change
     change_column :users, :balance, :float, :default => 100
    end
end
