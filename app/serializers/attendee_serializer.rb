class AttendeeSerializer < ActiveModel::Serializer
  attributes :id, :paid
  has_one :user
  has_one :event
end
