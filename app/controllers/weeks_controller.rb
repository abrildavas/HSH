class WeeksController < ApplicationController

  def index
    @weeks=Week.all

  end

  def show
    @week=Week.find(params[:id])

  end

  def destroy
     @week=Week.find(params[:id])
    if (@week.destroy)
     redirect_to "/", notice:"Se eliminó correctamente"
    else
    redirect_to "/",  notice:"Error al eliminar"
    end

  end

  def new
    @week=Week.new
  end

  def create
    @week=Week.new(params.require(:week).permit(:inicio ,:fin, :estado, :residence_id))

    if @week.save 
      redirect_to "/", notice: "se agregó la semana"

      else
        render :new
      end


  end
end
