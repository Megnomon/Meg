class PgnotificationMailer < ApplicationMailer
  default from: "offcoursemusiccompany@gmail.com"

  def send_pgscore_to_user(user, me, partscore)
    @user = user
    @me = me
    @partscore = partscore
    mail(
      subject: "貸出リクエストが届きました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
