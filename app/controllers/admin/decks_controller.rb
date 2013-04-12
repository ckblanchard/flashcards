class Admin::DecksController < ApplicationController
 before_filter :authenticate_admin!

  def index
    @decks = Deck.all
  end

 def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(params[:deck])

    if @deck.save
      redirect_to @deck, notice: 'Deck was successfully created.'
    else
      render action: "new"
    end
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def edit
    @deck = current_admin.deck
  end

  def update
    @deck = current_admin.deck

    if @deck.update_attributes(params[:deck])
      redirect_to @deck, notice: 'Deck was successfully updated.'
    else
      render action: "edit"
    end

  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy

    respond_to do |format|
      format.html { redirect_to decks_url }
      format.json { head :no_content }
    end
  end

  
end