class DeliveriesController < ApplicationController

  def new
    @orders = Order.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to schedules_path
    else
      redirect new
    end
  end

  def delivery_params
    params.require(:delivery).permit(:sequence[])
  end
end
