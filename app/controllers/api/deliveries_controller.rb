class Api::DeliveriesController < ApplicationController

  def schedule_orders
    # schedule = Schedule.find_by(trucker_id: params[:id], delivery_date: params[:date])
    # binding.pry
    order_sequence = Delivery.where(schedule_id: params[:id])
    orders = Order.where(id: order_sequence.collect{ |x| x.id})
    render json: orders, adapter: :json
  end

end