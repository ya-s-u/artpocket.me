class UserMailer < ActionMailer::Base
  default from: "noreply@artpocket.me"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.post_confirm.subject
  #
  def post_confirm(post)
    # @greeting = "Hi"
    #
    # mail to: "yasu1003@gmail.com"
    @post = post
    mail to: @post.mail,
         subject: "フライヤーの申請ありがとうございます"
  end
end
