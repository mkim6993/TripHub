# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def signup_email
    user = User.new(username: "testuser123", name: "Test user", email: "test@test.com", password: "test123", user_slogen: "im test")
    UserMailer.with(user: user).signup_email
  end
end
