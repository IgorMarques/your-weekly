class WeekliesController < ApplicationController
  Weekly = Struct.new(:date, :posts)

  def index
    posts = Post.all.group_by(&:sent_on)

    @weeklies = posts.map { |date, posts| Weekly.new(date, posts) }
  end
end
