class ApplicationMailer < ActionMailer::Base
  default from: ENV["EMAIL_FROM"]

  def sign_up(user)
    @user = user

    mail(
      to:      user.email,
      subject: "[Plumhire] Email confirmation"
    )
  end
end
