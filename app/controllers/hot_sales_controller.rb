class HotSalesController < ApplicationController

  def show
  	@hot_sale=HotSale.find(params[:id])
  	
  end

  def index
  	@hot_sales=HotSale.all

  end

  def create
	@hot_sale=HotSale.new(params.require(:hot_sale).permit(:precio ,:residence_id,:week_id))
  if @hot_sale.save 
      flash[:success] = 'El Hot sale se creó exitosamente. Para verlo, ingrese aquí en el calendario la fecha de inicio de la semana a la cual acaba de crearle el hot sale. '

       redirect_to week_dates_path(Week.find(@hot_sale.week.residence_id))

      else
        flash[:danger] = 'El Hot sale no pudo crearse.'
        render :new
      end

  end




  def new
  	@hot_sale=HotSale.new
    @week=Week.find(params[:id])
  

  end

    def destroy
     @hot_sale=HotSale.find(params[:id])
     @hot_sale.destroy
  end


def edit
  @week=Week.find(params[:id])
  @hot_sale=HotSale.where(week_id: @week.id, residence_id: @week.residence.id).first

end

 def update
  @week=Week.find(params[:id])
  @hot_sale=HotSale.where(week_id: @week.id, residence_id: @week.residence.id).first

   
    if @hot_sale.update(params.require(:hot_sale).permit(:precio, :residence_id, :week_id))
      redirect_to hot_sale_path(@hot_sale), notice:"Se actualizó la residencia #{@residence.nombre} correctamente"
    else
    redirect_to "/residences",  notice:"Error al actualizar el hot sale de #{@hot_sale.week.residence.nombre}"
    end
    
  end 


end
