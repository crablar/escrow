class RenameDurationToTimeToExpiration < ActiveRecord::Migration
  def change
    rename_column :articles, :duration, :time_to_expiration
  end
end
