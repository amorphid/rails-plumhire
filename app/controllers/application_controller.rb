class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!
    redirect_to sign_in_path if current_user.nil?
  end

  def authorize!(action, object)
    unless current_user == object.user
      render status: 403
    end
  end

  def authenticate_guest!
    redirect_to home_path unless current_user.nil?
  end

  def current_user
    # if session[:user_id] is nil, no need for database call
    return unless session[:user_id]

    if User.exists? session[:user_id]
      @user = User.find(session[:user_id])
    else
      session[:user_id] = nil
    end
  end
end
