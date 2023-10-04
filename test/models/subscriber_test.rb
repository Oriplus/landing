require "test_helper"

class SubscriberTest < ActiveSupport::TestCase
  def setup
    @subscriber = subscribers(:one)
  end

  test "should have many subscribers_preferences" do
    assert_respond_to @subscriber, :subscribers_preferences
  end

  test "should have many preferences through subscribers_preferences" do
    assert_respond_to @subscriber, :preferences
  end
end
