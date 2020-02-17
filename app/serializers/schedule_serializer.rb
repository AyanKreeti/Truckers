class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :trucker_id, :delivery_date, :schedule_name, :status, :created_at
end
