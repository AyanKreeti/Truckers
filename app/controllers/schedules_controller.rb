class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @orders = Order.all
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(truckers_id: schedule_params[:trucker_id], 
      delivery_date: schedule_params[:delivery_date])
    
    if @schedule.save!
      Order::update_orders(schedule_params[:sequence], @schedule.id)
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
    params.permit(:delivery_date, :trucker_id, :sequence)
  end
end