class AddTimerTitleToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :timer_title, :string
  end
end
