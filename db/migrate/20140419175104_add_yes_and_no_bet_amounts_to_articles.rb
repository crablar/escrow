class AddYesAndNoBetAmountsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :yes_bet_totals, :float
    add_column :articles, :no_bet_totals, :float
    t.float :yes_bet_totals, default:0
    t.float :no_bet_totals, default:0
  end
end