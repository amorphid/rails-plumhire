class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate!(boolean = true)
    @user = User.find_or_initialize_by(id: session[:user_id])

    # because authorization actions are stored in session[:can]
    # the following line provice a default value
    # this prevents getting nil errors
    # example:
    # session[:can][action] throws error if session[:can] is nil
    session[:can] ||= {}

    if @user.new_record?
      session[:user_id] = nil
      session[:can][:sign_in] = true
      session[:can][:sign_up] = true
    end

    if !@user.new_record? && boolean == false
      session[:can][:sign_up] = false
    end
  end

  def authorize!(action)
    redirect_to home_path unless session[:can][action]
  end
end
