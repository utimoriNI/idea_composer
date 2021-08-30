require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "アカウントの有効化", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    # メール内にユーザー名がある
    assert_match user.name,               mail.text_part.body.encoded, ["テキストメールの名前が一致しません"]
    assert_match user.name,               mail.html_part.body.encoded, ["HTMLメールの名前が一致しません"]
    # メール内に有効化トークンがある
    assert_match user.activation_token,   mail.text_part.body.encoded, ["トークンが一致しません"]
    assert_match user.activation_token,   mail.html_part.body.encoded, ["トークンが一致しません"]
    # メール内にメールアドレスがある
    assert_match CGI.escape(user.email),   mail.text_part.body.encoded, ["メールアドレスが一致しません"]
    assert_match CGI.escape(user.email),   mail.html_part.body.encoded, ["メールアドレスが一致しません"]
  end
end
