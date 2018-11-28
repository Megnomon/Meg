class DictationsController < ApplicationController
  def consent
    @dictation = Dictation.find(params[:id])
  end
  def index
    @dictations = Dictation.all
    if params[:search] == nil
        @dictations = Dictation.all
      elsif params[:search] == ""
        @dictations = Dictation.all
      else
        @dictations = Dictation.where("artist LIKE ? ",'%' + params[:search] + '%').or(Dictation.where("songs LIKE ? ", "%" + params[:search] + "%"))
      end
  end
  def new
    @dictation = Dictation.new
  end
  def show
    @dictation = Dictation.find(params[:id])
  end

  def create
    @dictation = Dictation.new(dictation_params)
    @dictation.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @dictation.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @dictation = Dictation.find(params[:id])
  end
  def update
    @dictation = Dictation.find(params[:id])
    @dictation.update(params.require(:dictation).permit(:artist,:songs,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @dictation = Dictation.find(params[:id])
    @dictation.destroy
    redirect_to action: "index"
  end
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def dictation_params
    params.require(:dictation).permit(:artist,:songs,:discription,:request)
  end
end
