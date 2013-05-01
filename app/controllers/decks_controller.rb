class DecksController < ApplicationController
  before_filter :authenticate_user!

  def index
    #@decks = Deck.all
    @decks = current_user.organization.decks

  end

  def show
    @deck = current_user.organization.decks.find(params[:id])

    # action for random deck_card for the user deck#show
    @deck_card = Card.random_card_for_deck(@deck)
    @guess = Guess.new
    @guess.card_id = @deck_card.id
    @guess.user_id = current_user.id

  end

  

 # def new
 #    @deck = Deck.new
 #  end

 #  def create
 #    @deck = Deck.new(params[:deck])

 #    if @deck.save
 #      redirect_to @deck, notice: 'Deck was successfully created.'
 #    else
 #      render action: "new"
 #    end
 #  end

  # def edit
  #   @deck = Deck.find(params[:id])
  # end

  # def update
  #   @deck = Deck.find(params[:id])

  #   if @deck.update_attributes(params[:deck])
  #     redirect_to @deck, notice: 'Deck was successfully updated.'
  #   else
  #     render action: "edit"
  #   end

  # end

  # def destroy
  #   @deck = Deck.find(params[:id])
  #   @deck.destroy

  #   respond_to do |format|
  #     format.html { redirect_to decks_url }
  #     format.json { head :no_content }
  #   end
  # end

  
end