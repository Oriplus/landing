require "test_helper"
require "mocha/minitest"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_email = "jhon.doe@gmail.com"
    @invalid_email_format = "invalidemail"
    @invalid_email = "invalidemail@qwe.rr"
    @valid_preference_ids = [preferences(:one).id, preferences(:two).id]
  end

  test "should get new" do
    get root_url
    assert_response :success
    assert_select "form"
  end

  test "should create subscriber with valid email and preferences" do
    EmailValidationService.any_instance.stubs(:call).returns({
      success: true,
      body: { "quality_score" => "0.9" },
    })
    assert_difference("Subscriber.count") do
      post subscribers_path, params: { subscriber: { email: @valid_email, preference_ids: @valid_preference_ids } }
    end

    assert_redirected_to root_path
    assert_equal I18n.t("subscribers.create.created"), flash[:notice]
  end

  test "should not create subscriber with invalid email format" do
    assert_no_difference("Subscriber.count") do
      post subscribers_path, params: { subscriber: { email: @invalid_email_format, preference_ids: @valid_preference_ids } }
    end
    assert_match /is invalid/, response.body
  end

  test "should not create subscriber if email verification fails" do
    EmailValidationService.any_instance.stubs(:call).returns({
      success: false,
      body: { "quality_score" => "0.5" },
    })

    assert_no_difference("Subscriber.count") do
      post subscribers_path, params: { subscriber: { email: @invalid_email, preference_ids: @valid_preference_ids } }
    end
    assert_match /#{I18n.t('subscribers.create.invalid_email')}/, response.body
  end
end
