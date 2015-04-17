class JobsController < ApplicationController
    before_filter :authenticate_user!

  def create
    job = Job.create(job_params)
    redirect_to company_job_path(job.company_id, job)
  end

  def edit
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new(company_id: params[:company_id])
  end

  def show
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    job.update(job_params)
    redirect_to company_job_path(job.company_id, job)
  end

  private

  def job_params
    params.require(:job).permit(:description, :title, :company_id)
  end
end
