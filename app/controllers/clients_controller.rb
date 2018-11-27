class ClientsController < ApplicationController
  def index
    #@clients = Client.all
  end

  def show
    #@client=Client.find(params[:id])
  end


  def delete

  end



  def create

    #@client=Client.new(params.require(:client).permit(:nombre ,:apellido, :dni, :fechaNac, :mail,:password,:fechaReg,:creditos))

    # @client.save 


    

  end


  def new
   # @client= Client.new

  end
end
