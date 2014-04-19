class RemoveUnusedColumnFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :text, :string
  end
end
