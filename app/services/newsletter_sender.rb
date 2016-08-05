class NewsletterSender
  include Service

  def call
    PostMailer.weekly_email(posts).deliver

    PostSentUpdater.call(posts)
  end

  private

  def posts
    @posts ||= Post.not_sent
  end
end
