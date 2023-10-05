class Preference < ApplicationRecord
  has_many :subscribers_preferences
  has_many :subscribers, through: :subscribers_preferences

  def translated_key_name
    I18n.t("preferences.#{key_name}")
  end
end
