class StaticPagesController < ApplicationController
  def email_sent
    @user = User.find(params[:id])
  end

  def sign_in
    if params[:email_confirmed]
      flash[:success] = "Email #{params[:email]} confirmed"
    end
  end
end
