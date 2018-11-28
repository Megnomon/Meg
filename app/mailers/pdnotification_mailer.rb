class PdnotificationMailer < ApplicationMailer
  default from: "offcoursemusiccompany@gmail.com"

  def send_pdscore_to_user(user, me, pdrum)
    @user = user
    @me = me
    @pdrum = pdrum
    mail(
      subject: "貸出リクエストが届きました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
