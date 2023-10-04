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

end
