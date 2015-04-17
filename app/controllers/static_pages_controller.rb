class StaticPagesController < ApplicationController
  def email_sent
    authenticate_guest!

    @user = User.new(email: params[:email])
  end

  def home
    authenticate_user!
  end

  def sign_in
    authenticate_guest!

    if params[:email_confirmed]
      flash[:success] = "Email #{params[:email]} confirmed"
    end
  end

  def sign_up
    authenticate_guest!

    @user = User.new
  end
end
