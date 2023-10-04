class SubscribersPreference < ApplicationRecord
  belongs_to :subscriber
  belongs_to :preference
end
