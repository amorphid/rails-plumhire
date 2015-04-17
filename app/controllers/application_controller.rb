class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include TotesCan

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
