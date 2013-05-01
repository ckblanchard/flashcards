class Card < ActiveRecord::Base
  attr_accessible :deck_id, :definition, :hint, :term, :guess_id, :guesses_attributes

  belongs_to :deck
  has_many :guesses
  accepts_nested_attributes_for :guesses

 # method to establish a random card in the user's deck#show
  def self.random_card_for_deck(deck)
  	total_cards = deck.cards.count
	card = deck.cards.limit(1).offset(rand(total_cards)).first
  end

 # find next card by id
  # def self.next_card(deck, card)
  # 	cards_array = deck.cards
  # 	# current_card = card
  # 	next_card = cards_array.shift
  # end

def previous
  Card.where("deck_id = ? AND id < ?", self.deck.id, self.id).last
end

def next
  Card.where("deck_id = ? AND id > ?", self.deck.id, self.id).first
end



end

