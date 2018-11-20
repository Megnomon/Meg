class UsersController < ApplicationController
  def create
    if @user.save
      NotificationMailer.send_confirm_to_user(@user).deliver
      redirect_to content:'tweets', action: 'complete'
    else
      redirect_to controller: 'tweets', action: 'index'
      flash[:danger] = 'リクエストの送信に失敗しました。'
    end
  end
  #
  # def send_confirm_to_user
  #   @user = params[:user]
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: '貸出リクエストが届きました')
  # end
end
