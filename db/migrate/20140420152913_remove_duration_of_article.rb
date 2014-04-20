class RemoveDurationOfArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :duration
  end
end
