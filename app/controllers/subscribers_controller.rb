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

  def unsubscribe
    subscriber = Subscriber.find_by(email: params[:unsubscribe][:email])

    if subscriber
      UnsubscribeMailSender.call(subscriber)
      redirect_to new_post_path, notice: 'Check your email to find your unsubscribe url!'
    else
      redirect_to new_post_path, notice: 'Email not found!'
    end
  end

  def cancel_subscription
    subscriber = Subscriber.find_by(delete_token: params[:delete_token])
    subscriber.destroy

    redirect_to new_post_path, notice: 'Subscription canceled!'
  end

  private

  def subscriber_params
    params.fetch(:subscriber).permit(:email)
  end
end
