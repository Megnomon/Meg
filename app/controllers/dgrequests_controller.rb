class DgrequestsController < ApplicationController
  def create
    @dgrequest = Dgrequest.new(dictation_id: params[:id])
    @dgrequest.user_id = current_user.id
    if @dgrequest.save
      DgnotificationMailer.send_dgscore_to_user(@dgrequest.dictation.user, current_user, @dgrequest.dictation).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'dictations', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @dictation = Dictation.find(params[:id])
    @dictation.dgrequests.last.update(rent: true)
    redirect_to controller: 'dictations', action: 'index'
  end

  def dgrequest_params
    params.require(:dgrequest).permit(:dictation_id)
  end
end
