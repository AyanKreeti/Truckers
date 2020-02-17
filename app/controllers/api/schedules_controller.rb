class Api::SchedulesController < ApplicationController

  def current_schedule
    schedules = Schedule.where(trucker_id: params[:id])
    # schedule = Schedule.find_by(trucker_id: params[:id], delivery_date: params[:date])
    # # binding.pry
    # order_sequence = Delivery.where(schedule_id: schedule.id)
    # orders = Order.where(id: order_sequence.collect{ |x| x.id})
    render json: schedules, adapter: :json
  end

  def schedule_params
    params.permit(:trucker_id)
  end
end