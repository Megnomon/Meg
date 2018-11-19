class UsersController < ApplicationController
  def create
    if @user.save
      NotificationMailer.send_confirm_to_user(@user).deliver
      redirect_to @user
    else
      redirect_to controller: 'tweets', action: 'consent'
    end
  end
  #
  # def send_confirm_to_user
  #   @user = params[:user]
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: '貸出リクエストが届きました')
  # end
end
