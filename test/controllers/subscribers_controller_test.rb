require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get root_url
    assert_response :success
    assert_select "form"
  end
end
