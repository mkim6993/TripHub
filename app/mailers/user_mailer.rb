class UserMailer < ApplicationMailer
  def signup_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to TripHub!')
  end
end
