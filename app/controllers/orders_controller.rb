class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end
  def create
    @schedule=  Schedule.all
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def create_schedule
    
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path(@order),flash: { success: "Orders Updated Successfully!" }
    else
      render :edit
    end
  end

  def order_params
    # binding.pry
    params.require(:order).permit(:name, :lat, :lng, :status, :address)
  end
end
