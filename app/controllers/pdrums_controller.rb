class PdrumsController < ApplicationController
  def consent
  end
  def index
    @pdrum = Pdrum.all
  end
  def new
    @pdrum = Pdrum.new
  end
  def show
    @pdrum = Pdrum.find(params[:id])
  end

  def create
    @pdrum = Pdrum.new(pdrum_params)
    @pdrum.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @pdrum.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @pdrum = Pdrum.find(params[:id])
  end
  def update
    @pdrum = Pdrum.find(params[:id])
    @pdrum.update(params.require(:pdrum).permit(:artist,:songs,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @pdrum = Pdrum.find(params[:id])
    @pdrum.destroy
    redirect_to action: "index"
  end
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def pdrum_params
    params.require(:pdrum).permit(:artist,:songs,:discription,:request)
  end
end
