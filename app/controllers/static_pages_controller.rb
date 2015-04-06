class StaticPagesController < ApplicationController
  def email_sent
    authorize_guest!

    @user = User.find(params[:id])
  end

  def home
    authorize_user!
  end

  def sign_in
    authorize_guest!

    if params[:email_confirmed]
      flash[:success] = "Email #{params[:email]} confirmed"
    end
  end

  def sign_up
    authorize_guest!

    @user = User.new
  end
end
