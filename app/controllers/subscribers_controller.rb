class SubscribersController < ApplicationController
  def index
    @subscribers = Subscriber.all
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.save
      redirect_to new_post_path, notice: 'Subscription created!'
    else
      render :new
    end
  end

  private

  def subscriber_params
    params.fetch(:subscriber).permit(:email)
  end
end
