class AuctionsController < ApplicationController
    

  def index
    @auctions=Auction.all
  end

  def show
    @auction=Auction.find(params[:id])
  end

  def create

      @auction=Auction.new(params.require(:auction).permit(:precioBase ,:precioActual,:week_id))
     @auction.precioActual=@auction.week.residence.precio 
    if @auction.save 
      flash[:success] = 'La subasta se creó exitosamente. Para ver dicha subasta, ingrese la fecha de inicio de la semana a la cual acaba de crearle la subasta. '

       AuctioneerList.all.each do |clientInList|
          if ((clientInList.week_id==@auction.week_id) and (Week.find(clientInList.week_id).residence_id)== (Week.find(@auction.week_id).residence_id)) then
           clientInList.auction_id=@auction.id
           clientInList.save
         end
       end
       redirect_to week_dates_path(Week.find(@auction.week_id).residence_id)

      else
        flash[:danger] = 'La subasta no pudo crearse.'
        render :new
      end



  end

  def new
    @auction=Auction.new
    @week=Week.find(params[:id])


  end


  def destroy
     @auction=Week.find(params[:id])
     @auction.destroy
  end

  def finishAuction
    @subasta=Auction.find(params[:id])
    @vacio=false
    @clienteGanador=nil

    if (@subasta.bids.first.nil?)
      @subasta.week.estado="Disponible"
      @subasta.week.save
      #Muestro en un modal
      @vacio=true      
  else # hay pujas...
  
  pujas=@subasta.bids.all.order('valor DESC')

  if (pujas.first.client.creditos>0) then 
    #Primer Mejor Postor Gana la subasta
    #Se Crea la reserva:
    
    @reserva=Reservation.create(precio: @subasta.precioActual, fecha: Date.today, fechaInicio: @subasta.week.inicio, fechaFin: @subasta.week.fin, client_id: pujas.first.client.id)
    @subasta.week.estado="No Disponible"
    @subasta.week.save
    @clienteGanador=Client.find(pujas.first.client.id)
       @clienteGanador.creditos=@clienteGanador.creditos-1
      @clienteGanador.save

  else
  
  
  long=pujas.count
  ganador=false
  i=1
  while  (!ganador && i<long)
    if (pujas[i].client.creditos>0)
      ganador=true
      iganador=i
    else
      i=i+1
    end
    
  end
  if (!ganador) then
      @subasta.week.estado="Disponible"
      @subasta.week.save
  else
    @reserva=Reservation.create(precio: pujas[iganador].valor, fecha: Date.today, fechaInicio: @subasta.week.inicio, fechaFin: @subasta.week.fin, client_id: pujas[iganador].client.id)
   @subasta.week.estado="No Disponible"
      @subasta.week.save
      @clienteGanador=Client.find(pujas[iganador].client.id)
      @clienteGanador.creditos=@clienteGanador.creditos-1
      @clienteGanador.save
  end
end

end # final del else si hay pujas
   Auction.find(params[:id]).destroy
  end
end