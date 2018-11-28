class PkrequestsController < ApplicationController
  def create
    @pkrequest = Pkrequest.new(pkeyboard_id: params[:id])
    @pkrequest.user_id = current_user.id
    if @pkrequest.save
      PknotificationMailer.send_pkscore_to_user(@pkrequest.pkeyboard.user, current_user, @pkrequest.pkeyboard).deliver
      redirect_to controller:'tweets', action: 'complete'
    else
      redirect_to controller: 'pkeyboards', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def update
    @pkeyboard = Pkeyboard.find(params[:id])
    @pkeyboard.pkrequests.last.update(rent: true)
    redirect_to controller: 'pkeyboards', action: 'index'
  end

  def pkrequest_params
    params.require(:pkrequest).permit(:pkeyboard_id)
  end
end
