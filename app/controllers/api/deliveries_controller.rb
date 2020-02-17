class Api::DeliveriesController < ApplicationController

  def schedule_orders
    # schedule = Schedule.find_by(trucker_id: params[:id], delivery_date: params[:date])
    # binding.pry
    order_sequence = Delivery.where(schedule_id: schedule.params[:schedule_id])
    orders = Order.where(id: order_sequence.collect{ |x| x.id})
    render json: orders, adapter: :json
  end

  def schedule_params
    params.permit(:schedule_id)
  end
end