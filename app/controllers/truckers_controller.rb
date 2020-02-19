class TruckersController < ApplicationController

  def index
    @truckers = Trucker.all
  end

  def new 
    
  end

  def create
    @trucker = Trucker.new(name: params[:name])
    if @trucker.save
      redirect_to truckers_path
    else
      render :new
    end
  end

end
