class ClientsController < ApplicationController

  def index

    @clients = Client.all
  end

  def show
    @client=Client.find(params[:id])
  end
  def edit

  end
  def view
    @client=Client.find(params[:id])
  end

  def create
    #@client=Client.new(params.require(:client).permit(:nombre ,:apellido, :dni, :fechaNac, :mail,:password,:fechaReg,:creditos))

    # @client.save 
  end

  def search
      if params.has_key?(:email)
        c=params[:email]
        @client=Client.find_by(email: c)
      elsif params.has_key?(:nombre)
        c=params[:nombre]
        @client=Client.find_by("nombre ILIKE ?", "%#{c}%")
      elsif params.has_key?(:apellido)
        c=params[:apellido]
        @client=Client.find_by("apellido ILIKE ?", "%#{c}%")
      elsif params.has_key?(:dni)
        c=params[:dni]
        @client=Client.find_by(dni: c)
      else
        flash[:error]='Por alguna razon no se ha insertado algun email, nombre o apellido'
        redirect_to root_path
      end
  end

  def new
  # @client= Client.new

  end

def ayuda

end

def contacto

end

def hacerPremium
  c=Client.find(params[:id])
  name=c.nombre+" "+c.apellido
  c.estado="premium"
  if c.save then
    redirect_to client_path(c),notice:"#{name} ahora es un cliente Premium ."
end
end


def hacerBasico
  c=Client.find(params[:id])
  name=c.nombre+" "+c.apellido
  c.estado="basico"
  if c.save then 
    redirect_to client_path(c),notice:"#{name} ahora es cliente básico ."    

  end

  end
end