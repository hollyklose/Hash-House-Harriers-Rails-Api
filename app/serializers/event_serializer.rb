class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :location, :description, :hare, :bag_car, :user_id
end
