class UnsubscribeMailSender
  include Service

  def call(subscriber)
    subscriber.update_attribute(:delete_token, SecureRandom.hex)
    UnsubscribeMailer.unsubscribe_email(subscriber).deliver_now
  end
end
