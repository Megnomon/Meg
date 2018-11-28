class PbnotificationMailer < ApplicationMailer
  default from: "offcoursemusiccompany@gmail.com"

  def send_pbscore_to_user(user, me, pbass)
    @user = user
    @me = me
    @pbass = pbass
    mail(
      subject: "貸出リクエストが届きました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
