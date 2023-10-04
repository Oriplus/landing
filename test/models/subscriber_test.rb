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

  test "should validate email presence" do
    @subscriber.email = nil
    assert_not @subscriber.valid?
    assert_includes @subscriber.errors[:email], "can't be blank"
  end

  test "should validate email uniqueness" do
    duplicate_subscriber = @subscriber.dup
    @subscriber.save
    assert_not duplicate_subscriber.valid?
    assert_includes duplicate_subscriber.errors[:email], "has already been taken"
  end

  test "should validate email format" do
    @subscriber.email = "invalid_email"
    assert_not @subscriber.valid?
    assert_includes @subscriber.errors[:email], "is invalid"
  end

  test "should validate presence of at least one preference" do
    @subscriber.preferences = []
    assert_not @subscriber.valid?
    assert_includes @subscriber.errors[:preferences], "must select at least one"
  end
end
