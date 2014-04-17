class Article < ActiveRecord::Base
  validates :title, presence: true,
            length: { minimum: 5 }
  validates :min_bet, presence: true,
            :numericality => {:only_integer => true}
end
