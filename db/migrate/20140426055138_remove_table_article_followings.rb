class RemoveTableArticleFollowings < ActiveRecord::Migration
  def change
    drop_table :table_article_followings
  end
end
