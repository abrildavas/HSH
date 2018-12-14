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
    


    if  ((@week.estado== "Reservada")  && ((params[:estado]== "Hot sale")|| (params[:estado]=="Subasta")))
      flash[:danger] = 'La residencia ya se encuentra reservada. '
    else
      if (@week.estado=="Hot sale") && (params[:estado]=="Hot sale")
           flash[:danger] = "Ya existe un Hot sale para esa semana de esta residencia"
       
      else
        if (@week.estado=="Subasta") && (params[:estado]=="Subasta")
           flash[:danger] = "Ya existe un Subasta para esa semana de esta residencia"

        else 



           @week.estado = params[:estado]
        if  (@week.estado=="Disponible" || @week.estado=="No disponible")  &&  (@week.save)
           flash[:success] = 'El estado de la residencia fue cambiado exitosamente. Para ver la semana nuevamente, vuelva a ingresar su fecha de inicio. '
       else
              if (!(@week.estado=="Subasta") && (!@week.estado=="Hot sale") )
                flash[:danger] = 'El estado de la residencia no fue posible cambiarlo.'
              end
       end


       if (@week.estado=="Subasta") 
            if (@week.inicio>=Date.today + 6.months) && (@week.inicio <=Date.today + 8.months)
                 if (@week.save)
                 redirect_to new_auction_path(@week.id) and return 
                 else 
                 flash[:danger] = 'No fue posible crear la subasta.'
                 end

            else
              flash[:danger] = 'Una subasta solo puede ser creada desde 6 a 8 meses a partir de la fecha actual'
            end 
      else 
             if (@week.estado=="Hot sale") 
                  if (@week.inicio<=Date.today + 6.months) 

                     if (@week.save)
                         redirect_to new_hot_sale_path(@week.id) and return
                     else
                      flash[:danger] = 'No fue posible crear el Hot sale.'
                     end
                  else 

                  flash[:danger] = 'Un Hot Sale solo puede ser creado desde la fecha actual hasta 6 meses.'

                 end 


            elsif (@week.estado=="Reservada")
                 if (@week.save)
                  new_reservation_path and return
                  else
                  flash[:danger] = 'No fue posible crear la reserva.'

                  end 
            end

        end

        end 




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
       @reserva=Reservation.create(precio: @residencia.precio, fecha: Date.today, fechaInicio: @week.inicio, fechaFin: @week.fin, client_id: @clienteGanador.id, residence_id: @week.residence_id)
       @week.estado = "Reservado"
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
