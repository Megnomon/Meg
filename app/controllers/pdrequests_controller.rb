class PdrequestsController < ApplicationController
  def create
    @pdrequest = Pdrequest.new(pdrum_id: params[:id])
    @pdrequest.user_id = current_user.id
    if @pdrequest.save
      PdnotificationMailer.send_pdscore_to_user(@pdrequest.pdrum.user, current_user, @pdrequest.pdrum).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'pdrums', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @pdrum = Pdrum.find(params[:id])
    @pdrum.pdrequests.last.update(rent: true)
    redirect_to controller: 'pdrums', action: 'index'
  end

  def pdrequest_params
    params.require(:pdrequest).permit(:pdrum_id)
  end
end
