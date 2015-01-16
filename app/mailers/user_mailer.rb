class UserMailer < ActionMailer::Base
  default from: "support@artpocket.me"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.post_confirm.subject
  #
  def post_confirm(post)
    @post = post
    mail to: "#{@post.mail}, support@artpocket.me",
         subject: "フライヤーの登録申請ありがとうございます"
  end
end
