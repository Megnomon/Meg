class DgnotificationMailer < ApplicationMailer
  default from: "offcoursemusiccompany@gmail.com"

  def send_dgscore_to_user(user, me, dictation)
    @user = user
    @me = me
    @dictation = dictation
    mail(
      subject: "貸出リクエストが届きました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
