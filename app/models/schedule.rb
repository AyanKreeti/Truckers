class Schedule < ApplicationRecord
  belongs_to :trucker
  has_many :deliveries

  validates :trucker_id, :delivery_date, presence: true
end
