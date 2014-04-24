class AddExpirationAndRemoveTimerTitle < ActiveRecord::Migration
  def change
    remove_column :articles, :timer_title
    add_column :articles, :expired, :boolean, :default => 100
  end
end
