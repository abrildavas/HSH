class BidsController < ApplicationController


  def index
    @bids=Bid.all
  end

  def show
    @bid=Bid.find(params[:id])
  end

  def delete

    
  end

  def create
    @auction=Auction.find(params[:auction_id])
    if params[:valor].to_i <= @auction.precioActual
        flash[:danger]="Ingrese un precio mayor al precio actual para hacer una puja"
        redirect_back fallback_location: root_path    
    else
    @bid=Bid.new
    @bid.valor=params[:valor]
    @bid.fecha=Time.now
    @bid.client_id=params[:client_id]
    @bid.auction_id=params[:auction_id]
    if @bid.save 
      @auction.precioActual=params[:valor]
      @auction.save
      flash[:success]="Se agregó la nueva oferta"
      redirect_to root_path
      else
        flash[:danger]="error"
        redirect_back fallback_location: root_path
      end    
    end
  end

  def new
    @bid=Bid.new
  end
end
