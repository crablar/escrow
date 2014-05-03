class ChangeImageToTopic < ActiveRecord::Migration
  def change
    rename_column :articles, :image, :topic
    change_column :articles, :topic, :string
  end
end
