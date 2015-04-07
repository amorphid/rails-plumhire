class CompaniesController < ApplicationController
  def new
    authorize_user!

    @company = Company.new
  end
end
