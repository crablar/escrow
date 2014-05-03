class AddImageToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :image, :string, :default => "/assets/money.jpg"
  end
end
