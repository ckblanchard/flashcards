class CardsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
  end

  def show
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
    @guess = Guess.new
    @guess.card_id = @card.id
    @guess.user_id = current_user.id
    @next = @card.next
    @previous = @card.previous
  end

  # def new
  #   @deck = Deck.find(params[:deck_id])
  #   @card = Card.new
  # end

  def edit
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
  end

  # def create
  #   @deck = Deck.find(params[:deck_id])
  #   @card = @deck.cards.build(params[:card])

  #   if @card.save
  #     redirect_to @deck
  #   else
  #     render action: :new
  #   end
  # end

  def update
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])


    if @card.update_attributes(params[:card])
      redirect_to deck_card_url, notice: 'Card was successfully updated.'
    else
      render action: "edit"
    end
  end

  # def destroy
  #   @card = Card.find(params[:id])
  #   @card.destroy

  #   redirect_to deck_cards_url
  # end
end