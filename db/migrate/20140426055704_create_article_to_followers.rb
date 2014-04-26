class CreateArticleToFollowers < ActiveRecord::Migration
  def change
    create_table :article_to_followers do |t|
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
