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

    @bid=Bid.new(params.require(:bid).permit(:valor ,:fecha))

    if @bid.save 
      redirect_to "#", notice: "se agregó la nueva oferta"

      else
        render :new
      end

  end

  def new
    @bid=Bid.new
  end
end
