class PgrequestsController < ApplicationController
  # protect_from_forgery except: :update
  def create
    @pgrequest = Pgrequest.new(partscore_id: params[:id])
    @pgrequest.user_id = current_user.id
    if @pgrequest.save
      PgnotificationMailer.send_pgscore_to_user(@pgrequest.partscore.user, current_user, @pgrequest.partscore).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'partscores', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @partscore = Partscore.find(params[:id])
    @partscore.pgrequests.last.update(rent: true)
    redirect_to controller: 'partscores', action: 'index'
  end

  def pgrequest_params
    params.require(:pgrequest).permit(:partscore_id)
  end
end
