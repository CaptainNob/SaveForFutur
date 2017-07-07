class LibraryController < ApplicationController
  
  def edit
    @cards = Card.all
    @library = current_user.library
  end
  
  def update
    card = Card.find_by(id: params[:card_id])
    
    # Suppression de la carte si elle fait partie dans les decks d'un joueur
    decks = current_user.decks
    decks.each do |d|
      number_of_card = d.send("card_#{card.id}")
      if number_of_card > 0
        number_of_card -= 1
        d.send("card_#{card.id} = ", number_of_card)
        d.save
      end
    end
    
    # Le seul cas de modification c'est quand on recycle une carte
    current_user.library.delete(card.id)
    current_user.dingdings += card.sell_price
    current_user.save
    
    respond_to do |format|
      format.html { redirect_to library_path, notice: "Carte vendu." }
      format.json { redirect_to library_path, status: 302 }
    end
  end
end
