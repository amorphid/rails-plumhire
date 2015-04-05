class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authorize!(action)
    redirect_to home_path session[:can][:sign_in]
  end
end
