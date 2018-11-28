class PartscoresController < ApplicationController
  def consent
    @partscore = Partscore.find(params[:id])
  end
  def index
    @partscores = Partscore.all
    if params[:search] == nil
        @partscores = Partscore.all
      elsif params[:search] == ""
        @partscores = Partscore.all
      else
        @partscores = Partscore.where("artist LIKE ? ",'%' + params[:search] + '%').or(Partscore.where("songs LIKE ? ", "%" + params[:search] + "%"))
      end
  end
  def new
    @partscore = Partscore.new
  end
  def show
    @partscore = Partscore.find(params[:id])
  end

  def create
    @partscore = Partscore.new(partscore_params)
    @partscore.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @partscore.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @partscore = Partscore.find(params[:id])
  end
  def update
    @partscore = Partscore.find(params[:id])
    @partscore.update(params.require(:partscore).permit(:artist,:songs,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @partscore = Partscore.find(params[:id])
    @partscore.destroy
    redirect_to action: "index"
  end
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def partscore_params
    params.require(:partscore).permit(:artist,:songs,:discription,:request)
  end
end
