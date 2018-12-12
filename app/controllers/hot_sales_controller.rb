class HotSalesController < ApplicationController

  def show
  	@hot_sale=HotSale.find(params[:id])
  	
  end

  def index
  	@hot_sales=HotSale.all

  end

  def create
	@hot_sale=HotSale.new(params.require(:hot_sale).permit(:precio ,:residence_id,:week_id))

    if @hot_sale.save 

      else
        render :new
      end
  end




  def new
  	@hot_sale=HotSale.new
    @week=Week.find(params[:id])
  

  end

    def destroy
     @hot_sale=HotSale.find(params[:id])
     @hot_sale.destroy
  end



end
