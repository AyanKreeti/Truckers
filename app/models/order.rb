class Order < ApplicationRecord

  def update_orders(order_list, schedule_id)
    for i in order_list
      Order.find(i.id).update!(schedule_id: schedule_id)
    end
  end

end
