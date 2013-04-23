class Guess < ActiveRecord::Base
  attr_accessible :card_id, :correct, :user_id

  belongs_to :user
  belongs_to :card

  
end
