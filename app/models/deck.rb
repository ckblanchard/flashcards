class Deck < ActiveRecord::Base
  attr_accessible :name, :organization_id, :topic_id, :description#, :guesses_attributes

  belongs_to :organization
  has_many :cards
#   accepts_nested_attributes_for :guesses

  validates :organization_id, :presence => true
  
  #calculate percentage correct for all guesses for a particular user's deck
  def percentage_of_deck_correct(deck)
  	#"Deck's id is #{deck.id}"
  	#"All of deck's cards are #{deck.cards}" => array of all cards
  	
  	# create array of all guesses
  	deck_card_guesses = []
  	number_correct = 0
  	total_guesses = 0
  	
  	# populate array of all guesses for a specific deck
  	deck.cards.each do |card| 
  		deck_card_guesses.push card.guesses
  	end
  	
  	#count all guesses for deck
  	deck_card_guesses.each do |card_guesses|
  		total_guesses += card_guesses.count
  		
  		# iterate through sub-array and find all the correct == true
  		card_guesses.each do |card_guess|
  			if card_guess.correct
  				number_correct += 1
  			end
  		end
  	end

  	# calculate percentage or say "no guesses yet"
  	unless total_guesses == 0
	  	percentage_correct = (number_correct / total_guesses.to_f * 1000).to_i/10.to_f
	  	"#{percentage_correct}% (#{number_correct} / #{total_guesses})"
  	else
  		"No guesses yet"
  	end
  end
 
 
# calculate stats for all guesses of a particular card
  def percentage_of_card_guesses_correct(card)
  	correct_guesses = 0
  	incorrect_guesses = 0
  	
  	# get all correct guesses for card
  	card.guesses.each do |guess|
		if guess[:correct] == true
			correct_guesses += 1
		else
			incorrect_guesses += 1
		end
	end
  
  	# get total guesses for card
  	total_guesses = correct_guesses + incorrect_guesses

  	# calculate percentage
  	unless total_guesses == 0
  		percentage_correct = (correct_guesses / total_guesses.to_f * 1000).to_i/10.to_f
	  	"#{percentage_correct}% (#{correct_guesses} / #{total_guesses})"
  	else
  		"No guesses yet"
  	end
  	
  end
  
end








