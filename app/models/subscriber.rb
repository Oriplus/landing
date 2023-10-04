class Subscriber < ApplicationRecord
  has_many :subscribers_preferences
  has_many :preferences, through: :subscribers_preferences
end
