# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :location, :description, :hare, :bag_car, :user_id, :editable, :attendees, :users
  belongs_to :event_creator,
             class_name: 'User',
             foreign_key: 'user_id',
             inverse_of: 'event_creator_recipients'

  def editable
    scope == object.event_creator
  end
end
