# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :hash_cash
  has_many :events
end
