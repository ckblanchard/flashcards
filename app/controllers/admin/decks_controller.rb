class Admin::DecksController < ApplicationController
 before_filter :authenticate_admin!

  # HAVE TO FIGURE OUT HOW TO LINK A NEW DECK WITH THE RIGHT ORG_ID

  def index
    @decks = current_admin.organization.decks
  end

 def new
    @deck = Deck.new
    @deck.organization = current_admin.organization
  end

  def create
    @deck = Deck.new(params[:deck])

    if @deck.save
      redirect_to [:admin, @deck], notice: 'Deck was successfully created.'
    else
      render :new
    end
  end

  def show
    @deck = current_admin.organization.decks.find(params[:id])
    #@deck = Deck.find(params[:id])
  end

  def edit
    @deck = current_admin.organization.decks.find(params[:id])
    #@deck = current_admin.organization.decks.find(params[:id])
  end

  def update
    @deck = current_admin.organization.decks.find(params[:id])
    #@deck = current_admin.organization.deck

    if @deck.update_attributes(params[:deck])
      redirect_to [:admin, @deck], notice: 'Deck was successfully updated.'
    else
      render :edit
    end

  end

  def destroy
    @deck = current_admin.organization.decks.find(params[:id])
    @deck.destroy

    redirect_to admin_decks_url, :notice => "Successfully destroyed deck."
  end

  
end