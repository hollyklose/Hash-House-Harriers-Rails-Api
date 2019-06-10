class Event < ApplicationRecord
  has_many :attendees
  has_many :users, through: :attendees
  default_scope { order(date: :asc) }
  belongs_to :event_creator,
             class_name: 'User',
             foreign_key: 'user_id',
             inverse_of: 'event_creator_recipients'
end
