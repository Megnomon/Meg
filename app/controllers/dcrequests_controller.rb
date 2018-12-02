class DcrequestsController < ApplicationController
  def create
    @dcrequest = Dcrequest.new(dchorus_id: params[:id])
    @dcrequest.user_id = current_user.id
    if @dcrequest.save
      DcnotificationMailer.send_dcscore_to_user(@dcrequest.d_chorus.user, current_user, @dcrequest.d_chorus).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'd_choruses', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @d_chorus = DChorus.find(params[:id])
    @d_chorus.dcrequests.last.update(rent: true)
    redirect_to controller: 'd_choruses', action: 'index'
  end

  def dcrequest_params
    params.require(:dcrequest).permit(:d_chorus_id)
  end
end
