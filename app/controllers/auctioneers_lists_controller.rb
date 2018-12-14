class AuctioneersListsController < ApplicationController
  def show
  	@list=AuctioneersList.find(params[:id])

  end

  def index
  end


  def ingresarClienteSinAuction(clientID,weekID,residenceID)
    
    @listClient=AuctioneersList.new(clientID,weekID,residenceID)
  end
  def ingresarClienteConAuction(auctionID,clientID,weekID)
  	@ @listClient=AuctioneersList.new(auctionID,clientID,weekID])
  	
  end
  def destroy
  	@list=AuctioneersList.find(params[:id])
  	@list.destroy
  end
  def esSubastador(clientID,weekID, residenceID)

  	if (!AuctioneersList.where(client_id: clientID,week_id: weekID, residence_id: residenceID).first.nil?)
  	return true 
  else return false
  		
  end
end
