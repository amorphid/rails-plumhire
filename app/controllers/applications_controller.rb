class ApplicationsController < ApplicationController
  before_filter :authorize_user!

  def create
    application = Application.create(application_params)
    redirect_to job_application_path(application.job_id, application)
  end

  def new
    @application = Application.new(job_id: params[:job_id])
  end

  private

  def application_params
    params.require(:application).permit(:email, :job_id, :name, :phone)
  end
end
