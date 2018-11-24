class NotificationMailer < ApplicationMailer
  default from: "offcoursemusiccompany@gmail.com"

  def send_confirm_to_user(user, me, tweet)
    @user = user
    @me = me
    @tweet = tweet
    mail(
      subject: "貸出リクエストが届きました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
