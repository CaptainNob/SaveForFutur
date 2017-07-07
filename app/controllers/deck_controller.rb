class DeckController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :deck_not_found
  before_action :find_deck, only: [:edit, :update, :destroy]
  
  def index
    @decks = current_user.decks
  end

  def new
    @deck = current_user.decks.new
  end

  def create
    @deck = current_user.decks.new(deck_params)
    @deck.card_16 = 1

    cards = 0
    @deck.each do |d|
      cards += d.send("card_#{card.id}")
    end

    if cards.in?(0..40)
      if @deck.save
        respond_to do |format|
          format.html { redirect_to decks_path, notice: 'Deck créée.' }
          format.json { redirect_to decks_path, status: 302 }
        end
      else
        respond_to do |format|
          format.html { render :new, alert: 'Erreur dans la création du deck.' }
          format.json { render json: @deck.errors, status: 422 }
        end
      end
    else
      respond_to do |format|
        format.html { render :new, alert: 'Un Deck ne peut comporter plus de 40 cartes ...' }
        format.json { render json: @deck.errors, status: 422 }
      end
    end
  end

  def edit
    @cards = Card.all
    
    fail ActiveRecord::RecordNotFound if @deck.nil?
  end

  def update
    @deck = current_user.decks.find(params[:id])
    @deck.update(deck_params)
    @deck.card_16 = 1
    
    cards = 0
    @deck.each do |d|
      cards += d.send("card_#{card.id}")
    end
    
    if cards.in?(0..40)
      if @deck.save
        respond_to do |format|
          format.html { redirect_to @deck, notice: 'Deck mis à jours.' }
          format.json { redirect_to @deck, status: 302, location: @deck }
        end
      else
        respond_to do |format|
          format.html { render :edit, alert: 'Erreur dans la sauvegarde.' }
          format.json { render json: @deck.errors, status: 422 }
        end
      end
    else
      respond_to do |format|
        format.html { render :edit, alert: 'Un Deck ne peut comporter plus de 40 cartes ...' }
        format.json { render json: @deck.errors, status: 422 }
      end
    end
  end

  def destroy
    if @deck.nil?
      fail ActiveRecord::RecordNotFound
    else
      if @deck.destroy
        respond_to do |format|
          format.html { redirect_to decks_path, notice: 'Deck supprimé.' }
          format.json { head :no_content, status: 204 }
        end
      else
        respond_to do |format|
          format.html { redirect_to @deck, alert: 'Erreur dans la suppression.' }
          format.json { render json: @deck.errors, status: 422 }
        end
      end
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :card_1, :card_2, :card_3, :card_4,
                                 :card_5, :card_6, :card_7, :card_8, :card_9,
                                 :card_10, :card_11, :card_12, :card_13,
                                 :card_14, :card_15, :card_16, :card_17,
                                 :card_18, :card_19, :card_20, :card_21,
                                 :card_22, :card_23, :card_24, :card_25,
                                 :card_26, :card_27, :card_28, :card_29,
                                 :card_30, :card_31, :card_32, :card_33,
                                 :card_34, :card_35, :card_36, :card_37,
                                 :card_38, :card_39, :card_40, :card_41,
                                 :card_42, :card_43, :card_44, :card_45,
                                 :card_46, :card_47, :card_48, :card_49,
                                 :card_50)
  end
  
  def find_deck
    @deck = Deck.find(params[:id])
  end
  
  def deck_not_found
    render 'decks/deck_missing', status: 404
  end
end
