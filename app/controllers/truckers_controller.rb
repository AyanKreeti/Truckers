class TruckersController < ApplicationController
  layout false
  def index
    render('index')
  end

  # def hello
  #   @array = [1,2,3,4,5]
  #   render('hello')
  # end

  # def hi
  #   redirect_to(:controller=> "orders", :action=> "index")
  # end
end
