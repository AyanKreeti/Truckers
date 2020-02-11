class Schedule < ApplicationRecord
  belongs_to :trucker
  has_many :orders
end
