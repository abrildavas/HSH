class AuctionsController < ApplicationController
  

  def index
    @auctions=Auction.all
  end

  def show
    @auction=Auction.find(params[:id])
  end

  def create

    @auction=Auction.new(params.require(:auction).permit(:precioBase ,:precioActual))

    if @auction.save 
      redirect_to "#", notice: "-"

      else
        render :new
      end



  end

  def new
    @auction=Auction.new
  end



  def delete
  end
end
