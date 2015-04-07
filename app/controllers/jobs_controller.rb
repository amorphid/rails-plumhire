class JobsController < ApplicationController
  def new
    authorize_user!
    @job = Job.new(company_id: params[:company_id])
  end
end
