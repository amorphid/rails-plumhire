class SignInsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      session[:user_id]       = user.id
      session[:can]           = {}
      session[:can][:sign_up] = true
      flash[:success] = "You are now signed in"
      redirect_to home_path
    end
  end
end
