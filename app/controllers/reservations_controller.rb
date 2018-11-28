class ReservationsController < ApplicationController

  def index
  	@reservations=Reservation.all

  end

  def show
  	@reservation=Reservation.find(params[:id])

  end

  def destroy
     @reservation=Reservation.find(params[:id])
    if (@reservation.destroy)
     redirect_to "/", notice:"Se eliminó correctamente"
    else
    redirect_to "/",  notice:"Error al eliminar"
    end

  end

  def create
  	@reservation=Reservation.new(params.require(:reservation).permit(:precio ,:fecha, :fechaInicio, :fechaFin, :client_id))
  

    if @reservation.save 
      redirect_to "/", notice: "se agregó la reserva"

      else
        render :new
      end


  end
  
end
