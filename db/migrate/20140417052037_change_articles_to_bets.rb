class ChangeArticlesToBets < ActiveRecord::Migration
  def change
    rename_table :articles, :bets
  end
end
