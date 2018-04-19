class StocksController < ApplicationController
    def create
      @stock = Stock.new(stock_params)
      if @stock.save
        flash[:notice] = "stock added"
        redirect_to root_path
      else
        flash[:alert] = "can't be blank"
        redirect_to root_path
      end
    end
    
    def destroy
      @stock = Stock.find(params[:id])
      @stock.destroy
      redirect_to root_path
    end
    
    private
      
      def stock_params
        params.require(:stock).permit(:name, :entry, :stop_loss)
      end
    
end
