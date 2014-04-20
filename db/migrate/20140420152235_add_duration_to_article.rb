class AddDurationToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :duration, :string, :default => "1 minute"
  end
end
