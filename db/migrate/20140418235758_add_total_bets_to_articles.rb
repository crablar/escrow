class AddTotalBetsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :total_bets, :default => 0
  end
end
