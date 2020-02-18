class TruckersController < ApplicationController
  layout false
  def index
    @truckers = Trucker.all
  end

end
