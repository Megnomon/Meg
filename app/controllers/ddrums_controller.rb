class DdrumsController < ApplicationController
  def consent
  end
  def index
    @ddrum = Ddrum.all
  end
  def new
    @ddrum = Ddrum.new
  end
  def show
    @ddrum = Ddrum.find(params[:id])
  end

  def create
    @ddrum = Ddrum.new(ddrum_params)
    @ddrum.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @ddrum.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @ddrum = Ddrum.find(params[:id])
  end
  def update
    @ddrum = Ddrum.find(params[:id])
    @ddrum.update(params.require(:ddrum).permit(:artist,:songs,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @ddrum = Ddrum.find(params[:id])
    @ddrum.destroy
    redirect_to action: "index"
  end
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def ddrum_params
    params.require(:ddrum).permit(:artist,:songs,:discription,:request)
  end
end
