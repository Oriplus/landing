class Subscriber < ApplicationRecord
  has_many :subscribers_preferences
  has_many :preferences, through: :subscribers_preferences

  validates :email, uniqueness: true, presence: :true
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  validate :selected_preferences

  private

  def selected_preferences
    errors.add(:preferences, :must_select_at_least_one) if preferences.empty?
  end
end
