class DbrequestsController < ApplicationController
  def create
    @dbrequest = Dbrequest.new(dbass_id: params[:id])
    @dbrequest.user_id = current_user.id
    if @dbrequest.save
      DbnotificationMailer.send_dbscore_to_user(@dbrequest.dbass.user, current_user, @dbrequest.dbass).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'dbasses', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @dbass = Dbass.find(params[:id])
    @dbass.dbrequests.last.update(rent: true)
    redirect_to controller: 'dbasses', action: 'index'
  end

  def dbrequest_params
    params.require(:dbrequest).permit(:dbass_id)
  end
end
