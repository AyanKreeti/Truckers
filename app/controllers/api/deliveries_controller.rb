class Api::DeliveriesController < ApplicationController
  protect_from_forgery with: :null_session
  def schedule_orders
    # schedule = Schedule.find_by(trucker_id: params[:id], delivery_date: params[:date])
    # binding.pry
    # order_sequence = Delivery.where(schedule_id: params[:id]).where(status: "pending")
    order_sequence = Delivery.where(schedule_id: params[:id])
    orders = Order.where(id: order_sequence.collect{ |x| x.order_id})
    # binding.pry
    orders = Delivery.order_tsp(orders)
    # binding.pry
    render json: orders, adapter: :json
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