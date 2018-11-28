class DcrequestsController < ApplicationController
  def create
    @dcrequest = Dcrequest.new(dchorus_id: params[:id])
    @dcrequest.user_id = current_user.id
    if @dcrequest.save
      DcnotificationMailer.send_dcscore_to_user(@dcrequest.dchorus.user, current_user, @dcrequest.dchorus).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'dchoruses', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @dchorus = Dchorus.find(params[:id])
    @dchorus.dcrequests.last.update(rent: true)
    redirect_to controller: 'dchoruses', action: 'index'
  end

  def dcrequest_params
    params.require(:dcrequest).permit(:dchorus_id)
  end
end
