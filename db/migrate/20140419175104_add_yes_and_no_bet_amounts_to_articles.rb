class AddYesAndNoBetAmountsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :yes_bet_total, :float, :default => 0
  end
end