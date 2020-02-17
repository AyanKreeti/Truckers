class OrderSerializer < ActiveModel::Serializer
  attributes :id, :name, :lat, :lng, :status, :created_at
end
