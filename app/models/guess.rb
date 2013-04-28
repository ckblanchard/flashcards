class Guess < ActiveRecord::Base
  attr_accessible :card_id, :correct, :user_id

  belongs_to :user
  belongs_to :card


  
end



#-------------------
#   def deck_percent_correct
#   	deck = current_user.organization.decks.find(params[:id])
#   	
#   	for card in deck
#   		guesses = card.guesses.correct.push
#   	end
#   	
#   	
#   	# find all guesses for a specific deck of cards
#   	@correct_guesses = guesses.count{ |guess| guess == true }
#   	
# #   	guesses.each do |guess|
# #   		if correct == true
# #   			correct_guesses += 1
# #   		end
# #   	end
# 
#   	# sum the total true of those guesses
#   	total_guesses = guesses.length
#   	
#   	# return the percentage
#   	@percentage = correct_guesses.percent_of(total_guesses)
#   	return @percentage
#   end