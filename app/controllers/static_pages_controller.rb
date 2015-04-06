class StaticPagesController < ApplicationController
  def email_sent
    @user = User.find(params[:id])
  end

  def home
    authorize!
  end

  def sign_in
    reauthorize!

    if params[:email_confirmed]
      flash[:success] = "Email #{params[:email]} confirmed"
    end
  end

  def sign_up
    reauthorize!

    @user = User.new
  end
end
