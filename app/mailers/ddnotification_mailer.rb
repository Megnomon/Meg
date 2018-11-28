class DdnotificationMailer < ApplicationMailer
  default from: "offcoursemusiccompany@gmail.com"

  def send_ddscore_to_user(user, me, ddrum)
    @user = user
    @me = me
    @ddrum = ddrum
    mail(
      subject: "貸出リクエストが届きました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
