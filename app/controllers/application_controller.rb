class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize_user!
    redirect_to sign_in_path if current_user.nil?
  end

  def authorize_guest!
    redirect_to home_path unless current_user.nil?
  end

  def can?(action, object)
    klass = object.class

    rules = {
      edit: {
        Job => true if current_user.is_a? Poster
      }
    }

    true if rules[action][klass]
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
