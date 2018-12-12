class ResidencesController < ApplicationController


  def index
    render layout: false
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

  #Metodos del buscador:
  #----------------------
  #Vista inicial del buscador
 
 def buscador
if (!(administrator_signed_in?) && (!(client_signed_in?))) then
  redirect_to "/"
end
end

#El cliente ya presiono en buscar
  def searchClient
    if !(client_signed_in?) then
  redirect_to "/"
else
  @busqueda=params[:nombre]
  if !params[:criterio].blank?
    @opcion=params[:criterio]
  end

  end
end



#El administrador ya presiono en buscar
def searchAdmin

  if !(administrator_signed_in?) then
  redirect_to "/"
  else
  @busqueda=params[:nombre]
  if !params[:criterio].blank?
    @opcion=params[:criterio]
  end
end
end



end
