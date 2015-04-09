class SignUpsController < ApplicationController
  def create
    user = User.create(
      email: params[:email],
      password: params[:password]
    )
    ApplicationMailer.sign_up(user).deliver_now
    redirect_to email_sent_path(user, { email: user.email })
  end
end
