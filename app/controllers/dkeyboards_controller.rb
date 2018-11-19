class DkeyboardsController < ApplicationController
  def consent
  end
  def index
    @dkeyboard = Dkeyboard.all
  end
  def new
    @dkeyboard = Dkeyboard.new
  end
  def show
    @dkeyboard = Dkeyboard.find(params[:id])
  end

  def create
    @dkeyboard = Dkeyboard.new(dkeyboard_params)
    @dkeyboard.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @dkeyboard.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @dkeyboard = Dkeyboard.find(params[:id])
  end
  def update
    @dkeyboard = Dkeyboard.find(params[:id])
    @dkeyboard.update(params.require(:dkeyboard).permit(:artist,:songs,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @dkeyboard = Dkeyboard.find(params[:id])
    @dkeyboard.destroy
    redirect_to action: "index"
  end
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def dkeyboard_params
    params.require(:dkeyboard).permit(:artist,:songs,:discription,:request)
  end
end
