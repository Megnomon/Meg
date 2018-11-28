class PknotificationMailer < ApplicationMailer
  default from: "offcoursemusiccompany@gmail.com"

  def send_pkscore_to_user(user, me, pkeyboard)
    @user = user
    @me = me
    @pkeyboard = pkeyboard
    mail(
      subject: "貸出リクエストが届きました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
