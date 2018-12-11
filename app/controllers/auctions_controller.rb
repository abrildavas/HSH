class AuctionsController < ApplicationController
  

  def index
    @auctions=Auction.all
  end

  def show
    @auction=Auction.find(params[:id])
  end

  def create

      @auction=Auction.new(params.require(:auction).permit(:precioBase ,:precioActual,:week_id))
    if @auction.save 
      flash[:success] = 'La subasta se creó exitosamente. Para ver dicha subasta, ingrese la fecha de inicio de la semana a la cual acaba de crearle la subasta. '

       redirect_to week_dates_path(Week.find(@auction.week_id).residence_id)

      else
        flash[:danger] = 'La subasta no pudo crearse.'
        render :new
      end



  end

  def new
    @auction=Auction.new
    @week=Week.find(params[:id])

  end


  def destroy
     @auction=Week.find(params[:id])
     @auction.destroy
  end


end
