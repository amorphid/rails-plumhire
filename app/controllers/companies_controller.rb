class CompaniesController < ApplicationController
  before_filter :authorize_user!

  def create
    company = Company.new(company_params)
    company.save
    redirect_to company_path(company)
  end

  def new
    @company = Company.new
  end

  def show
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
