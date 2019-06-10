# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :attendees
  has_many :events, through: :attendees
  has_many :event_creator_recipients,
           class_name: 'Event',
           inverse_of: 'event_creator'
end
