class AddYesAndNoBetAmountsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :yes_bet_total, :float
    t.float :yes_bet_total, default: 0
  end
end