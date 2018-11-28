class DchorusesController < ApplicationController
  def consent
    @dchorus = Dchorus.find(params[:id])
  end
  def index
    @dchoruses = Dchorus.all
    if params[:search] == nil
        @dchoruses = Dchorus.all
      elsif params[:search] == ""
        @dchoruses = Dchorus.all
      else
        @dchoruses = Dchorus.where("artist LIKE ? ",'%' + params[:search] + '%').or(Dchorus.where("songs LIKE ? ", "%" + params[:search] + "%"))
      end
  end
  def new
    @dchorus = Dchorus.new
  end
  def show
    @dchorus = Dchorus.find(params[:id])
  end

  def create
    @dchorus = Dchorus.new(dchorus_params)
    @dchorus.user_id=current_user.id
  #新しいTweetの保存に成功した場合
    if @dchorus.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しいTweetの保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
  end
  def edit
    @dchorus = Dchorus.find(params[:id])
  end
  def update
    @dchorus = Dchorus.find(params[:id])
    @dchorus.update(params.require(:dchorus).permit(:artist,:songs,:discription,:request))
    redirect_to action: "index"
  end
  def destroy
    @dchorus = Dchorus.find(params[:id])
    @dchorus.destroy
    redirect_to action: "index"
  end
  private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
  def dchorus_params
    params.require(:dchorus).permit(:artist,:songs,:discription,:request)
  end
end
