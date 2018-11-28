class DbassesController < ApplicationController
  def consent
    @dbass = Dbass.find(params[:id])
  end
  def index
    @dbasses = Dbass.all
    if params[:search] == nil
        @dbasses = Dbass.all
      elsif params[:search] == ""
        @dbasses = Dbass.all
      else
        @dbasses = Dbass.where("artist LIKE ? ",'%' + params[:search] + '%').or(Dbass.where("songs LIKE ? ", "%" + params[:search] + "%"))
      end
  end
  def new
    @dbass = Dbass.new
  end
  def show
    @dbass = Dbass.find(params[:id])
  end

  def create
    @dbass = Dbass.new(dbass_params)
    @dbass.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @dbass.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @dbass = Dbass.find(params[:id])
  end
  def update
    @dbass = Dbass.find(params[:id])
    @dbass.update(params.require(:dbass).permit(:artist,:songs,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @dbass = Dbass.find(params[:id])
    @dbass.destroy
    redirect_to action: "index"
  end
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def dbass_params
    params.require(:dbass).permit(:artist,:songs,:discription,:request)
  end
end
