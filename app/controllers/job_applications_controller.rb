class JobApplicationsController < ApplicationController
  def index
    @applications = JobApplication.all
    render json: @applications, status: :ok
  end

  def create
    @application = JobApplication.new(application_params)
    if @application.save
      render json: { message: "Application successfully created",
      application: @application }, status: :created
    else
      render json: { errors: @application.errors.full_message }, status: :unprocessable_entity
    end
  end

  def application_params
    params.require(:job_application).permit(:title, :company, :user_id)
  end
end
