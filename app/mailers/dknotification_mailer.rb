class DknotificationMailer < ApplicationMailer
  default from: "offcoursemusiccompany@gmail.com"

  def send_dkscore_to_user(user, me, dkeyboard)
    @user = user
    @me = me
    @dkeyboard = dkeyboard
    mail(
      subject: "貸出リクエストが届きました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
