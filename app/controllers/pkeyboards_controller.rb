class PkeyboardsController < ApplicationController
  def consent
    @pkeyboard = Pkeyboard.find(params[:id])
  end
  def index
    @pkeyboards = Pkeyboard.all
    if params[:search] == nil
        @pkeyboards = Pkeyboard.all
      elsif params[:search] == ""
        @pkeyboards = Pkeyboard.all
      else
        @pkeyboards = Pkeyboard.where("artist LIKE ? ",'%' + params[:search] + '%').or(Pkeyboard.where("songs LIKE ? ", "%" + params[:search] + "%"))
      end
  end
  def new
    @pkeyboards = Pkeyboard.new
  end
  def show
    @pkeyboard = Pkeyboard.find(params[:id])
  end

  def create
    @pkeyboards = Pkeyboard.new(pkeyboard_params)
    @pkeyboards.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @pkeyboards.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @pkeyboard = Pkeyboard.find(params[:id])
  end
  def update
    @pkeyboard = Pkeyboard.find(params[:id])
    @pkeyboard.update(params.require(:pkeyboard).permit(:artist,:songs,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @pkeyboard = Pkeyboard.find(params[:id])
    @pkeyboard.destroy
    redirect_to action: "index"
  end
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def pkeyboard_params
    params.require(:pkeyboard).permit(:artist,:songs,:discription,:request)
  end
end
