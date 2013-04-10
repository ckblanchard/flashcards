class Card < ActiveRecord::Base
  attr_accessible :deck_id, :definition, :hint, :term

  belongs_to :deck
end
