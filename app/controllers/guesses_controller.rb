class GuessesController < ApplicationController
  # def new
  # 	@guess = Guess.new
  # end

  def create
  #   #need user_id
  #   #need card_id
    # @deck = current_user.organization.decks.find(params[:id])
    # @deck_card = Card.random_card_for_deck(@deck)
    
  	@guess = Guess.new(params[:guess])
    #@guess.user_id = current_user.id
    #@guess.card_id = @deck_card.id
  # 	redirect_to deck_path(@deck)
  	if @guess.save
  		redirect_to :back, notice: "Your guess was saved."
  	else
  		redirect_to :back, notice: "There was a problem saving your guess."
    end
  end

end



    # action for random deck_card for the user deck#show
    