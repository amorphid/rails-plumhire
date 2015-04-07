class CompaniesController < ApplicationController
  before_filter :authorize_user!

  def create
  end

  def new
    @company = Company.new
  end
end
