class DeliveriesController < ApplicationController

  def index
    @deliveries = Delivery.all.order(:schedule_id)
  end

  def new
    @assigned_orders = Delivery.where(status: "pending")
    @orders = Order.joins("LEFT JOIN deliveries ON orders.id = deliveries.order_id").
    select('orders.id, orders.name, orders.address, orders.lat, orders.lng, deliveries.status, deliveries.schedule_id')

    @schedules = Schedule.all
    @delivery = Delivery.new
  end

  def create
    max_sequence = Delivery.where(schedule_id: params[:schedule_id]).maximum("sequence")
    
    if max_sequence.nil?
      max_sequence = 0
    end

    params[:order_ids].each_with_index do |order_id, index| 
      Order.find(order_id).update!(status: "assigned")
      Delivery.create!(schedule_id: params[:schedule_id], order_id: order_id, status: "pending", sequence: max_sequence + index + 1)
    end
    redirect_back fallback_location: root_path, flash: { success: " Schedule Updated" }
    
  end

  def delivery_params
    params.permit(:schedule_id, order_ids: [])
  end
end
