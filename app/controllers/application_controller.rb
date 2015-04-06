class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize!(action)
    # because authorization actions are stored in session[:can]
    # the following line provice a default value
    # this prevents getting nil errors
    # example:
    # session[:can][action] throws error if session[:can] is nil
    session[:can] ||= {}

    redirect_to home_path unless session[:can][action]
  end
end
