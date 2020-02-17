class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @orders = Order.all
    @schedule = Schedule.new
  end

  def create
    # binding.pry
    # delivery = Delivery.create!(sequence: schedule_params[:order_ids])
    @schedule = Schedule.new(trucker_id: schedule_params[:trucker_id], 
      delivery_date: schedule_params[:delivery_date], schedule_name: schedule_params[:trucker_id] + " on "+ schedule_params[:delivery_date])
      
    if @schedule.save!
      redirect_to schedules_path
    else
      binding.pry
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.permit(:delivery_date, :trucker_id, order_ids: [])
  end
end