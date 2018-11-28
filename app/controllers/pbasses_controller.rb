class PbassesController < ApplicationController
  def consent
    @pbass = Pbass.find(params[:id])
  end
  def index
    @pbasses = Pbass.all
    if params[:search] == nil
        @pbasses = Pbass.all
      elsif params[:search] == ""
        @pbasses = Pbass.all
      else
        @pbasses = Pbass.where("artist LIKE ? ",'%' + params[:search] + '%').or(Pbass.where("songs LIKE ? ", "%" + params[:search] + "%"))
      end
  end
  def new
    @pbass = Pbass.new
  end
  def show
    @pbass = Pbass.find(params[:id])
  end

  def create
    @pbass = Pbass.new(pbass_params)
    @pbass.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @pbass.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @pbass = Pbass.find(params[:id])
  end
  def update
    @pbass = Pbass.find(params[:id])
    @pbass.update(params.require(:pbass).permit(:artist,:songs,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @pbass = Pbass.find(params[:id])
    @pbass.destroy
    redirect_to action: "index"
  end
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def pbass_params
    params.require(:pbass).permit(:artist,:songs,:discription,:request)
  end
end
