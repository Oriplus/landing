require "test_helper"

class PreferenceTest < ActiveSupport::TestCase
  def setup
    @preference = preferences(:one)
  end

  test "should have many subscribers_preferences" do
    assert_respond_to @preference, :subscribers_preferences
  end

  test "should have many suscribers through subscribers_preferences" do
    assert_respond_to @preference, :suscribers
  end

  test "should return translated key name" do
    @preference.key_name = "womens_fashion"
    assert_equal "Women's Fashion", @preference.translated_key_name
  end
end
