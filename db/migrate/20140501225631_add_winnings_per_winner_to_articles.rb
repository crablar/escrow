class AddWinningsPerWinnerToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :winnings_per_winner, :float, :default => 0
  end
end
