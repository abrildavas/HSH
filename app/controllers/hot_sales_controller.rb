class HotSalesController < ApplicationController

  def show
  	@hot_sale=Hot_sale.find(params[:id])
  	
  end

  def index
  	@hot_sales=Hot_sale.all

  end

  def create
	@hot_sale=Hot_sale.new(params.require(:hot_sale).permit(:precio ,:residence_id,:week_id))

    if @hot_sale.save 

      else
        render :new
      end
  end




  def new
  	@hot_sale=Hot_sale.new
    @week=Week.find(params[:week_id])
  

  end

    def destroy
     @hot_sale=Hot_sale.find(params[:id])
     @hot_sale.destroy
  end



end
