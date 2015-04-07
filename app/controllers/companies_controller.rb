class CompaniesController < ApplicationController
  def new
    authorize_user!
  end
end
