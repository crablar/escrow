class ChangeDefaultArticleImage < ActiveRecord::Migration
  def change
	  change_column :users, :avatar, :string, :default => "anonymous.jpg"
	  change_column :articles, :topic, :string, :default => "money.jpg"
  end
end
