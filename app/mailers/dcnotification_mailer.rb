class DcnotificationMailer < ApplicationMailer
  default from: "offcoursemusiccompany@gmail.com"

  def send_dcscore_to_user(user, me, d_chorus)
    @user = user
    @me = me
    @d_chorus = d_chorus
    mail(
      subject: "貸出リクエストが届きました。", #メールのタイトル,
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end
