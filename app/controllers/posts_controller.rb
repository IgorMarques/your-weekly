class PostsController < ApplicationController
  def index
    @sent_posts = Post.sent.order(id: :desc)
    @not_sent_posts = Post.not_sent.order(id: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to new_post_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.fetch(:post).permit(:title, :url, :description)
  end
end
