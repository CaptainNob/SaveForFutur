class GachaController < ApplicationController
  def index
    @gachas = Gacha.all
  end
  
  def create
    # Achat de Kibrilles
    gacha = Gacha.find_by(id: params[:id])
    if gacha.kibrilles
      if current_user.kibrilles - gacha.price >= 0
        current_user.kibrilles -= gacha.price
        refactor_upper_create(gacha)
      else
        refactor_lower_create
      end
    else
      if current_user.dingdings - gacha.price >= 0
        current_user.dingdings -= gacha.price
        refactor_upper_create(gacha)
      else
        refactor_lower_create
      end
    end
  end
  
  private
  
  def refactor_upper_create(gacha)
    current_user.save
    random_card = card_dropper(gacha)
    card = current_user.library.send("card_#{random_card}")
    current_user.library.send("card_#{random_card}=", card+1)
    current_user.library.save
    card = Card.find(random_card)
    redirect_to root_path, notice: "Vous venez d'acquérir #{card.name}, utilisez le comme il le mérite ..."
  end
  
  def refactor_lower_create
    redirect_to gachas_path, alert: "Vous navez pas les moyens de vous l'offir ..."
  end
  
  def card_dropper(gacha)
    random_card = rand(1..10000)
    if random_card === (1..(gacha.rare1 * 100))
      rand(1..7)
    elsif random_card === (gacha.rare1 * 100..((gacha.rare1 * 100) + (gacha.rare2 * 100)))
      rand(8..9)
    else
      rand(10..15)
    end
  end
end
