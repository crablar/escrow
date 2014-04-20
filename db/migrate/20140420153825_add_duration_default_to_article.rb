class AddDurationDefaultToArticle < ActiveRecord::Migration
    def change
      add_column :articles, :duration, :integer, :default => 60
    end
end
