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
  client=Client.find(params[:id])
  name=c.nombre+" "+c.apellido
  client.estado="basico"
  if client.save then 
    redirect_to client_path(client),notice:"#{name} ahora es cliente básico ."    

  end

  end
end