class PostSentUpdater
  include Service

  def call(posts)
    posts.each do |post|
      post.update_attribute(:sent_on, Time.zone.now)
    end
  end
end
