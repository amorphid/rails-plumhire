class ApplicationsController < ApplicationController
  before_filter :authorize_user!

  def new
    @application = Application.new(job_id: params[:job_id])
  end
end
