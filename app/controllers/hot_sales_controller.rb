class HotSalesController < ApplicationController

  def show
  	@hot_sale=HotSale.find(params[:id])
  	
  end

  def index
  	@hot_sales=HotSale.all

  end

  def create
	@hot_sale=HotSale.new(params.require(:hot_sale).permit(:precio ,:residence_id,:week_id))

 
    if (@hot_sale.save )
      flash[:success] = 'El Hot sale se creó exitosamente. Para verlo, ingrese aquí en el calendario la fecha de inicio de la semana a la cual acaba de crearle el hot sale. '
       redirect_to week_dates_path(Week.find(@hot_sale.week.residence_id))

    else
        flash[:danger] = 'El Hot sale no pudo crearse.'
        render :new
     end
 
  end




  def new
  	
    @week=Week.find(params[:id])
       if !(Week.where(inicio: @week.inicio, estado: "Hot sale", residence_id: @week.residence.id).first.nil?)
              @hot_sale=HotSale.new
        end
end



    def destroy
     @hot_sale=HotSale.find(params[:id])
     @hot_sale.destroy
  end


def edit
     @hot_sale=HotSale.find(params[:id])
end

 def update
  @hot_sale=HotSale.find(params[:id])
   
    if @hot_sale.update(params.require(:hot_sale).permit(:precio, :residence_id, :week_id))
      flash[:success] = "Se actualizó el precio del Hot Sale de la residencia #{@hot_sale.residence.nombre} correctamente"
      redirect_to hot_sale_path(@hot_sale)
       
    else
    redirect_to "/residences",  notice:
    flash[:danger] = "Error al actualizar el hot sale de #{@hot_sale.week.residence.nombre}"
    end
    
  end 
  
    def reservarHotsale
    @hotsale=HotSale.find(params[:id])
    @hotsale.week.estado="No Disponible"
    @reserva=Reservation.create(precio: @hotsale.precio, fecha: Date.today, fechaInicio: @hotsale.week.inicio, fechaFin: @hotsale.week.fin, client_id: params[:client_id] )
    destroy(@hotsale.id)
    
end


end
