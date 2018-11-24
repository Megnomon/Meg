class RequestsController < ApplicationController
  def create
    @request = Request.new(tweet_id: params[:id])
    @request.user_id = current_user.id
    # @request.username = User.find(username: params[:username])
    if @request.save
      NotificationMailer.send_confirm_to_user(@request.tweet.user, current_user, @request.tweet).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'tweets', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.requests.last.update(rent: true)
    redirect_to controller: 'tweets', action: 'index'
  end

  def request_params
    params.require(:request).permit(:tweet_id)
  end
end
