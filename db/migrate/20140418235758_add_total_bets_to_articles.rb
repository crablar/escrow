class AddTotalBetsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :total_bets, :float
    t.float :total_bets, default: 0
  end
end
