class AddWinningSideToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :winning_side, :string, :default => "draw"
  end
end
