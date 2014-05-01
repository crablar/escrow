class ChangeWasPaidOutToWasEvaluated < ActiveRecord::Migration
  def change
    rename_column :bets, :was_paid_out, :was_evaluated
  end
end
