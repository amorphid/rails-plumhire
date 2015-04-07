class CompaniesController < ApplicationController
  before_filter :authorize_user!

  def create
    company = Company.new(company_params)
    company.user = current_user
    company.save!
    redirect_to company_path(company)
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
