class JobsController < ApplicationController
  def create
    authorize_user!
    job = Job.new(company_id: params[:company_id])
    job.save
    redirect_to company_job_path(job)
  end

  def new
    authorize_user!
    @job = Job.new(company_id: params[:company_id])
  end
end
