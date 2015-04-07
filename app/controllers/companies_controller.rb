class CompaniesController < ApplicationController
  def create
  end

  def new
    authorize_user!

    @company = Company.new
  end
end
