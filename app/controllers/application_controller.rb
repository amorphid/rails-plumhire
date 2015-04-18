class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include TotesCan

  helper_method :can?
end
