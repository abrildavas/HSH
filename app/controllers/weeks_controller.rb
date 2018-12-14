class WeeksController < ApplicationController

  def index
    @weeks=Week.all

  end

  def show
    fecha = Date.parse(params[:fechaInicio])
    @residence=Residence.find(params[:residence_id])
    if (fecha != fecha.monday) 
       flash[:danger] = 'Ingrese una fecha que empiece un lunes' 
       redirect_to week_dates_path(@residence)
    else 
      @week=Week.where(residence_id: params[:residence_id],inicio: fecha)
      if (@week.any? == false)
          @week = Week.new(residence_id: params[:residence_id],inicio: fecha,fin: fecha + 7.days,estado: "No disponible")
          if (fecha<=Date.today + 8.months && fecha>=Date.today + 6.months) 
          @week.estado = "Disponible"
          end
          @week.save
      else
      @week = @week.first
     end
   end
end

  def destroy
     @week=Week.find(params[:id])
     @week.destroy
  end


  def new
    @week=Week.new
  end


  def create
    @week=Week.new(params.require(:week).permit(:inicio ,:fin, :estado, :residence_id, :hot_sale_id))
    @week.save 
  end


  def dates
     @residence=Residence.find(params[:id])

  end


  def modificarEstado 
    @week=Week.find(params[:week_id])
    @week.estado = params[:estado]

    if  (@week.save) && (@week.estado=="Disponible" || @week.estado=="No disponible")
      flash[:success] = 'El estado de la residencia fue cambiado exitosamente. Para ver la semana nuevamente, vuelva a ingresar su fecha de inicio. '
    else
      if (!(@week.estado=="Subasta") && (!@week.estado=="Hot sale") )
         flash[:danger] = 'El estado de la residencia no fue posible cambiarlo.'
      end

      if (@week.save) && (@week.estado=="Subasta")
        redirect_to new_auction_path(@week.id) and return 
        elsif (@week.save)&& (@week.estado=="Hot sale")
           redirect_to new_hot_sale_path(@week.id) and return
        end       
    end
    redirect_to week_dates_path(@week.residence_id)
  end





  def reservarPremium
    @week=Week.find(params[:format])
    @clienteGanador=Client.find(current_client.id)
    @residencia=Residence.find(@week.residence_id)
    if (@clienteGanador.creditos>0)
       @clienteGanador.creditos=@clienteGanador.creditos - 1
       @reserva=Reservation.create(precio: @residencia.precio, fecha: Date.today, fechaInicio: @week.inicio, fechaFin: @week.fin, client_id: @clienteGanador.id)
       @week.estado = "reservado"
       @reserva.save
       @clienteGanador.save
       @week.save
       flash[:success] = "Usted se ha adjucado la propiedad con exito"
       redirect_to root_path
    else
       flash[:danger] = "Usted no tiene los suficientes creditos como para reservar esta propiedad"
       redirect_back fallback_location: root_path
    end
  end 





end
