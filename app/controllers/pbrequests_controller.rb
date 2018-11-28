class PbrequestsController < ApplicationController
  def create
    @pbrequest = Pbrequest.new(pbass_id: params[:id])
    @pbrequest.user_id = current_user.id
    if @pbrequest.save
      PbnotificationMailer.send_pbscore_to_user(@pbrequest.pbass.user, current_user, @pbrequest.pbass).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'pbasses', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @pbass = Pbass.find(params[:id])
    @pbass.pbrequests.last.update(rent: true)
    redirect_to controller: 'pbasses', action: 'index'
  end

  def pbrequest_params
    params.require(:pbrequest).permit(:pbass_id)
  end
end
