class AddDefaultToArticles < ActiveRecord::Migration
  def change
    change_column :articles, :creator_id, :integer, :default => -1
  end
end
