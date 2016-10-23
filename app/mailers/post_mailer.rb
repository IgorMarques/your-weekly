class PostMailer < ApplicationMailer
  default bcc: proc { Subscriber.email_list },
          from: 'your-weekly@test.com'

  def weekly_email(posts)
    @posts = posts
    @date = Date.today

    mail(subject: "Your Weekly - #{@date}")
  end
end
