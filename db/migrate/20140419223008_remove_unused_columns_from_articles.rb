class RemoveUnusedColumnsFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :title, :string
    remove_column :articles, :yes_bet_totals, :float
    remove_column :articles, :no_bet_totals, :float
    remove_column :articles, :TotalBets, :float
  end
end