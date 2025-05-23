class JobApplicationsController < ApplicationController
before_action :authenticate_user!

  def index
    @applications = current_user.job_applications.includes(:resume, :cover_letter, :ai_insight, :email_tracking)
    render json: @applications, each_serializer: JobApplicationSerializer, status: :ok
  end


def create
  @application = current_user.job_applications.new(application_params)

  if @application.save
    # 💡 Create nested records if present
    @application.create_resume(resume_params) if params[:resume].present?
    @application.create_cover_letter(cover_letter_params) if params[:cover_letter].present?
    @application.create_ai_insight(ai_insight_params) if params[:ai_insight].present?
    @application.create_email_tracking(email_tracking_params) if params[:email_tracking].present?

    render json: {
      message: "Application successfully created",
      application: @application
    }, status: :created
  else
    render json: { errors: @application.errors.full_messages }, status: :unprocessable_entity
  end
end


def application_params
  params.require(:job_application).permit(
    :title, :company, :location, :status, :date_applied, :source,
    :url, :notes, :tags, :job_type, :job_description
  )
end

def resume_params
  params.require(:resume).permit(:file_url, :profession)
end

def cover_letter_params
  params.require(:cover_letter).permit(:file_url, :tone, :summary)
end

def ai_insight_params
  params.require(:ai_insight).permit(:match_score, :suggested_skills, :tone_suggestions)
end

def email_tracking_params
  params.require(:email_tracking).permit(:thread_id, :last_email_snippet, :last_updated_from_email)
end

end
