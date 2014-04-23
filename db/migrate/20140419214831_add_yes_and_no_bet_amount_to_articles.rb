class AddYesAndNoBetAmountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :yes_bet_total, :float, :default => 0
    add_column :articles, :no_bet_total, :float, :default => 0
  end
end
