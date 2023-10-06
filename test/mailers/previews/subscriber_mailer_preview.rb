# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/subscriber_mailer/subscriber_created
  def subscriber_created
    SubscriberMailer.subscriber_created
  end

end
