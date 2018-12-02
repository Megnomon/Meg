class DChorusesController < ApplicationController
  def consent
    @d_chorus = DChorus.find(params[:id])
  end
  def index
    @d_choruses = DChorus.all
    if params[:search] == nil
        @d_choruses = DChorus.all
      elsif params[:search] == ""
        @d_choruses = DChorus.all
      else
        @d_choruses = DChorus.where("artist LIKE ? ",'%' + params[:search] + '%').or(DChorus.where("songs LIKE ? ", "%" + params[:search] + "%"))
      end
  end
  def new
    @d_chorus = DChorus.new
  end
  def show
    @d_chorus = DChorus.find(params[:id])
  end

  def create
    @d_chorus = DChorus.new(d_chorus_params)
    @d_chorus.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @d_chorus.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @d_chorus = DChorus.find(params[:id])
  end
  def update
    @d_chorus = DChorus.find(params[:id])
    @d_chorus.update(params.require(:d_chorus).permit(:artist,:songs,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @d_chorus = DChorus.find(params[:id])
    @d_chorus.destroy
    redirect_to action: "index"
  end
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def d_chorus_params
    params.require(:d_chorus).permit(:artist,:songs,:discription,:request)
  end
end
