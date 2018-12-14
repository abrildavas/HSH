class AuctioneersListsController < ApplicationController
  def show
  	@week=Week.find(params[:id])
    @residence=Residence.find(@week.residence_id)
  	

  end

  def new
  	@auctioneersList=AuctioneersList.new
  	
  end

  def create
    @auctioneersList=AuctioneersList.new
    @auctioneersList.auction_id=params[:auction_id]
    @auctioneersList.client_id=params[:client_id]
    @auctioneersList.week_id=params[:week_id]
    @auctioneersList.residence_id=params[:residence_id]
    if (@auctioneersList.save)
    	redirect_back fallback_location: auction_path(params[:auction_id])

      else
      	
        flash[:danger]="Error "
        redirect_back fallback_location: root_path
      end    
  end



  def index
  end
   def destroy
  	@list=AuctioneersList.find(params[:id])
  	@list.destroy
  end

  def ingresarClienteToAuction
  	
  	@list=AuctioneersList.new(params[:client_id],params[:week_id],params[:residence_id])
  	redirect_to :back
  end


  

  def ingresarClienteSinAuction(clientID,weekID,residenceID)
    
    @listClient=AuctioneersList.new(clientID,weekID,residenceID)
  end
  
  def ingresarClienteConAuction(auctionID,clientID,weekID,residenceID)
  	 @listClient=AuctioneersList.new(auctionID,clientID,weekID,residenceID)
  	
  end


  
  def esSubastador(clientID,weekID,residenceID)

  	if (!AuctioneersList.where(client_id: clientID,week_id: weekID, residence_id: residenceID).first.nil?)
  	return true 
  else return false
  end
end
  

end
