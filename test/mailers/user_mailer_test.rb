require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "post_confirm" do
    mail = UserMailer.post_confirm
    assert_equal "Post confirm", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
