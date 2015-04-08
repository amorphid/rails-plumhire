class JobsController < ApplicationController
    before_filter :authorize_user!

  def create
    job = Job.create(job_params)
    redirect_to company_job_path(job.company_id, job)
  end

  def new
    @job = Job.new(company_id: params[:company_id])
  end

  def show
  end

  private

  def job_params
    params.require(:job).permit(:description, :title, :company_id)
  end
end
