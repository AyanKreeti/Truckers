class Api::DeliveriesController < ApplicationController
  protect_from_forgery with: :null_session
  def schedule_orders
    # schedule = Schedule.find_by(trucker_id: params[:id], delivery_date: params[:date])
    # binding.pry
    # order_sequence = Delivery.where(schedule_id: params[:id]).where(status: "pending")
    order_sequence = Delivery.where(schedule_id: params[:id]).where(status: "delivered")
    pending_order_sequence = Delivery.where(schedule_id: params[:id]).where.not(status: "delivered")
    orders = Order.where(id: order_sequence.collect{ |x| x.order_id})
    pending_orders = Order.where(id: pending_order_sequence.collect{ |x| x.order_id})
    # binding.pry
    loc=Hash.new
    loc["lat"] = params[:lat]
    loc["lng"] = params[:lng]
    pending_order_list = Delivery.order_tsp(loc,pending_orders)
    all_orders = orders + pending_order_list
    # binding.pry
    render json: all_orders, adapter: :json
  end

  def update_order_status
    # Order.joins("LEFT JOIN deliveries ON orders.id = deliveries.order_id").
    # select('orders.id,orders.status')

    # Order.joins("LEFT JOIN deliveries ON orders.id = deliveries.order_id").where('orders.id': params[:id]).update('orders.status': "Delivered").update('deliveries.status': "Delivered")
    # Order.joins("LEFT JOIN deliveries ON orders.id = deliveries.order_id").where('orders.id': 1).update('orders.status': "Delivered").update('deliveries.status': "Delivered")


    Delivery.find_by(order_id: params[:order_id]).update(status: "delivered")
    Order.find(params[:order_id]).update(status: "delivered")
    order=Order.find(params[:order_id])
    render json: order, adapter: :json
  end

  

end