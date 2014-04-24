class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.integer :article_id
      t.boolean :is_yes

      t.timestamps
    end
  end
end
