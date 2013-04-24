class Card < ActiveRecord::Base
  attr_accessible :deck_id, :definition, :hint, :term, :guess_id

  belongs_to :deck
  has_many :guesses

 # method to establish a random card in the user's deck#show
  def self.random_card_for_deck(deck)
  	total_cards = deck.cards.count
	card = deck.cards.limit(1).offset(rand(total_cards)).first
  end
end

