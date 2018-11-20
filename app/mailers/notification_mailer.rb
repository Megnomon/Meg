class NotificationMailer < ApplicationMailer
  default from: "hogehoge@example.com"

  def send_confirm_to_user(user)
    @request = user
    mail(
      subject: "貸出リクエストが届きました。" #メールのタイトル,
      to: @request.user.email #宛先
    ) do |format|
      format.text
    end
  end
end
