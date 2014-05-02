class AddWasPaidOutToBets < ActiveRecord::Migration
  def change
    add_column :bets, :was_paid_out, :boolean, :default => false
  end
end
