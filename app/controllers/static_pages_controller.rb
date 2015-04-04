class StaticPagesController < ApplicationController
  def email_sent
    @user = User.find(params[:id])
  end
end
