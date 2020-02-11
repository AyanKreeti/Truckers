class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    # binding.pry
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
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
    params.require(:order).permit(:name, :lat, :lng, :status)
  end
end
