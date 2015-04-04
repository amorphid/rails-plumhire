class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
    redirect_to email_sent_path(user)
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
