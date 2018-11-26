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
  def dates
    fecha = Date.parse(params[:fechaInicio])
    if (fecha != fecha.monday) 
       flash[:danger] = 'Ingrese una fecha que empieze el lunes' 
    else 
        flash[:success] = 'El checkeo funciona'
        @week = Week.where(residence_id: params[:residence_id],inicio: fecha)
        if (@week.any? == false)
            @week = Week.new(residence_id: params[:residence_id],inicio: fecha,fin: fecha + 7.days,estado: "Libre") 
            if (@week.save)
               flash[:success] = "En la semana del " + fecha.strftime("%d/%m/%Y") + " la propiedad esta en estado Libre"
            else
               flash[:error] = "La propiedad no tiene nada en la semana por alguna razon"
            end
        else 
            flash[:success] = "En la semana del " + @week.first.inicio.strftime("%d/%m/%Y") + " la propiedad esta en estado " + @week.first.estado
        end
    end
    redirect_back(fallback_location: root_path)
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