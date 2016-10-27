class UnsubscribeMailer < ApplicationMailer
  default from: 'your-weekly@test.com'

  def unsubscribe_email(subscriber)
    @subscriber = subscriber

    mail(subject: "Your weekly unsubscribe url", to: @subscriber.email)
  end
end
