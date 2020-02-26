class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :lat, :lng, :status, :created_at
end
