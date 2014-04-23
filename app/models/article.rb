class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true,
            length: { minimum: 5 }
  validates :min_bet, presence: true


end