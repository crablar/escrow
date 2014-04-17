class AddMinBetToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :min_bet, :integer
  end
end
