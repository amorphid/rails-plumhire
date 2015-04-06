class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
    ApplicationMailer.sign_up(user).deliver_now
    redirect_to email_sent_path(user, { email: user.email })
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
