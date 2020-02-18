class Order < ApplicationRecord
  validates :name,:address,:lat,:lng, presence: true
  validates :status, presence: true, inclusion: { in: ['created', 'delivered', 'assigned', 'pending'] }
end
