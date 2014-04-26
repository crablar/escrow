class CreateTableArticleFollowings < ActiveRecord::Migration
  def change
    create_table :table_article_followings do |t|
      t.integer :article_id
      t.integer :user_id
    end
  end
end
