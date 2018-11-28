class DkrequestsController < ApplicationController
  def create
    @dkrequest = Dkrequest.new(dkeyboard_id: params[:id])
    @dkrequest.user_id = current_user.id
    if @dkrequest.save
      DknotificationMailer.send_dkscore_to_user(@dkrequest.dkeyboard.user, current_user, @dkrequest.dkeyboard).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'dkeyboards', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @dkeyboard = Dkeyboard.find(params[:id])
    @dkeyboard.dkrequests.last.update(rent: true)
    redirect_to controller: 'dkeyboards', action: 'index'
  end

  def dkrequest_params
    params.require(:dkrequest).permit(:dkeyboard_id)
  end
end
