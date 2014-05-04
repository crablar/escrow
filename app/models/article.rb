class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true,
            length: { minimum: 5 }
  validates_numericality_of :min_bet, presence: true, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000


end