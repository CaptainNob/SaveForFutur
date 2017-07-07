class PurchaseHistoriesController < ApplicationController
  def index
    # Affichage des pack de Kibrilles
    @pack_kibrilles = KibrillesPack.all
  end

  def create
    # Achat de Kibrilles
    kibrille_pack = KibrillesPack.find_by(id: params[:id])
    current_user.purchase_histories.create(kibrilles: kibrille_pack.kibrilles, euros: kibrille_pack.euros)
    current_user.kibrilles += kibrille_pack.kibrilles
    current_user.save
    
    redirect_to root_path, notice: "Vous êtes plus riche de #{kibrille_pack.kibrilles}, ne dépencez pas tout d'un coup ..."
  end
  
  private
  
  def purchase_history_params
    params.require(:purchase_history).permit(:kibrilles, :euros)
  end
end
