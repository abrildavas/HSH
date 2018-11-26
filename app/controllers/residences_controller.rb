class ResidencesController < ApplicationController

  def index

  end

  def show
    @residence=Residence.find(params[:id])

  end


  def new
  	@residence= Residence.new

  end


  def edit
    @residence=Residence.find(params[:id])

  end
  def cambio
    @residence=Residence.find(params[:residence_id])
    fecha = Date.parse(params[:inicio])
    @week = Week.where(residence_id: params[:residence_id],inicio: fecha)
    estado = params[:estado]
    case estado
    when "Libre"  
      @auction = Auction.find_by(week_id: @week.first.id)
      if (@auction != nil)
         @auction.delete
      end  
      @week.first.estado = "Libre"  
    when "No disponible" 
      @auction = Auction.find_by(week_id: @week.first.id)
      if (@auction != nil)
         @auction.delete
      end 
      @week.first.estado = "No disponible"   
    when "Subasta"
      @week.first.estado = "Subasta"
      @auction = Auction.new
      @auction.precioBase = @residence.precio
      @auction.precioActual = @residence.precio
      @auction.week_id = @week.first.id 
      if (@auction.save)
        flash[:success] = 'Se creo correctamente la subasta'
      else
        flash[:danger] = 'Por alguna razon se ingreso un estado equivocado'
      end
    when "Hot sale"
      @auction = Auction.find_by(week_id: @week.first.id)
      if (@auction != nil)
         @auction.delete
      end  
      precio = params[:precio]     
      if !(precio.nil? || precio.empty?)
        @week.first.estado = "Hot sale"
        @week.first.preciohs = precio
      else  
        flash[:danger] = 'No se ha entrado un precio para el hot sale'
        redirect_back(fallback_location: "/residences") and return
      end
    else
      flash[:danger] = 'Por alguna razon se ingreso un estado equivocado'
      redirect_back(fallback_location: "/residences") and return 
    end
    if (@week.first.save)
     flash[:success] = 'Se ha hecho el cambio con exito'
     redirect_to "/residences"
    else
     flash[:danger] = 'Ha habido un error desconocido'
     redirect_back(fallback_location: "/residences")      
    end
  end

  def editarEstado
    fecha = Date.parse(params[:fechaInicio])
    if (fecha != fecha.monday) 
     flash[:danger] = 'Ingrese una fecha que empieze el lunes'
     redirect_back(fallback_location: residences_path)
   end
   @residence=Residence.find(params[:residence_id])
   @week = Week.where(residence_id: params[:residence_id],inicio: fecha)
   if (@week.any? == false)
    @week = Week.new(residence_id: params[:residence_id],inicio: fecha,fin: fecha + 7.days,estado: "No disponible")
    if (fecha<=Date.today + 8.months && fecha>=Date.today + 6.months) 
      @week.estado = "Libre"
    end
   else
    @week = @week.first
   end
  end

  def dates
    fecha = Date.parse(params[:fechaInicio])
    if (fecha != fecha.monday) 
       flash[:danger] = 'Ingrese una fecha que empieze el lunes' 
    else 
        flash[:success] = 'El checkeo funciona'
        @week = Week.where(residence_id: params[:residence_id],inicio: fecha)
        if (@week.any? == false)
            @week = Week.new(residence_id: params[:residence_id],inicio: fecha,fin: fecha + 7.days,estado: "No disponible") 
            if (fecha<=Date.today + 8.months && fecha>=Date.today + 6.months) 
                @week.estado = "Libre"
            end
            if (@week.save)
               flash[:success] = "En la semana del " + @week.inicio.strftime("%d/%m/%Y") + " la propiedad esta en estado " + @week.estado
            else
               flash[:error] = "La propiedad no tiene nada en la semana por alguna razon"
            end
        else 
            flash[:success] = "En la semana del " + @week.first.inicio.strftime("%d/%m/%Y") + " la propiedad esta en estado " + @week.first.estado
        end
    end
    redirect_back(fallback_location: residences_path)
  end

  def create
  	@residence=Residence.new(params.require(:residence).permit(:nombre ,:descripcion, :urlImag, :precio, :estado,:pais,:provincia,:localidad, :direccion))

  	if @residence.save 
  		redirect_to "/residences", notice: "se agregó la nueva propiedad"

  		else
  			render :new
      end

  end
  
  def destroy
    @residence=Residence.find(params[:id])
    name=@residence.nombre
    if (@residence.destroy)
     redirect_to "/residences", notice:"Se eliminó la residencia #{name} correctamente"
    else
    redirect_to "/residences",  notice:"Error al eliminar la residencia #{name}"
    end
  end

  def update
    @residence=Residence.find(params[:id])
    if @residence.update(params.require(:residence).permit(:nombre, :descripcion, :urlImag,:precio, :pais, :provincia, :localidad, :direccion))
      redirect_to residence_path(@residence), notice:"Se actualizó la residencia #{@residence.nombre} correctamente"
    else
    redirect_to "/residences",  notice:"Error al actualizar la residencia #{@residence.nombre}"
    end
  end 
end