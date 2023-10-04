class Preference < ApplicationRecord
  has_many :subscribers_preferences
  has_many :suscribers, through: :subscribers_preferences
end
