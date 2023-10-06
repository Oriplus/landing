require "test_helper"

class SubscriberMailerTest < ActionMailer::TestCase
  setup do
    @subscriber = subscribers(:one)
  end

  test "should send subscriber_created email" do
    email = SubscriberMailer.subscriber_created(@subscriber).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal [@subscriber.email], email.to

    assert_equal I18n.t("subscriber_mailer.subscriber_created.email_subject"), email.subject

    assert_match I18n.t("subscriber_mailer.subscriber_created.email_title"), email.body.encoded

    assert_match I18n.t("subscriber_mailer.subscriber_created.email_body"), email.body.encoded
  end
end