class DbnotificationMailer < ApplicationMailer
  default from: "offcoursemusiccompany@gmail.com"

  def send_dbscore_to_user(user, me, dbass)
    @user = user
    @me = me
    @dbass = dbass
    mail(
      subject: "貸出リクエストが届きました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
