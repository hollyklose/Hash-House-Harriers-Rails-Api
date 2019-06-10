class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :location, :description, :hare, :bag_car, :user_id, :editable
  has_many :users

  def editable
    scope == object.event_creator
  end
end
