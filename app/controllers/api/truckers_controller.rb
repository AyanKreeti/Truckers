class Api::TruckersController < ApplicationController

  def truckers_list
    truckers = Trucker.all
    render json: truckers, adapter: :json
  end
end