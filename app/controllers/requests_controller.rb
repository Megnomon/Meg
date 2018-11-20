class RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)
    if @request.save
      NotificationMailer.send_confirm_to_user(@request).deliver
      redirect_to content:'tweets', action: 'complete'
    else
      redirect_to controller: 'tweets', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end

  def request_params
    params.require(:request).permit(:socre_id)
  end
end
