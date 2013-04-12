class Admin::CardsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @deck = current_admin.deck
    @cards = @deck.cards
  end

  def show
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
  end

  def new
    @deck = Deck.find(params[:deck_id])
    @card = Card.new
  end

  def edit
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:id])
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards.build(params[:card])

    if @card.save
      redirect_to @deck
    else
      render action: :new
    end
  end

  def update
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:id])


    if @card.update_attributes(params[:card])
      redirect_to deck_card_url, notice: 'Card was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to deck_cards_url
  end
end