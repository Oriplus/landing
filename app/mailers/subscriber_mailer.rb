class SubscriberMailer < ApplicationMailer
  def subscriber_created(subscriber)
    mail(to: subscriber.email, subject: t(".email_subject"))
  end
end
