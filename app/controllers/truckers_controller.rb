class TruckersController < ApplicationController

  def index
    @truckers = Trucker.all
  end

end
