class TweetsController < ApplicationController
  def consent
  end
  def index
    @tweet = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @tweet.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(params.require(:tweet).permit(:artist,:songs,:part,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to action: "index"
  end
  
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def tweet_params
    params.require(:tweet).permit(:artist,:songs,:part,:discription,:request)
  end




end
