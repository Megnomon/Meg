class DdrequestsController < ApplicationController
  def create
    @ddrequest = Ddrequest.new(ddrum_id: params[:id])
    @ddrequest.user_id = current_user.id
    if @ddrequest.save
      DdnotificationMailer.send_ddscore_to_user(@ddrequest.ddrum.user, current_user, @ddrequest.ddrum).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'ddrums', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @ddrum = Ddrum.find(params[:id])
    @ddrum.ddrequests.last.update(rent: true)
    redirect_to controller: 'pdrums', action: 'index'
  end

  def ddrequest_params
    params.require(:ddrequest).permit(:ddrum_id)
  end
end
