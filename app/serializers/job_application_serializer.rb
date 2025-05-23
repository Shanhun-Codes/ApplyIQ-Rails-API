class JobApplicationSerializer < ActiveModel::Serializer
  attributes :id, :title, :company, :location, :source, :url, :date_applied,
             :status, :notes, :tags, :job_type, :job_description,
             :created_at, :updated_at, :user_id

  has_one :resume
  has_one :cover_letter
  has_one :ai_insight
  has_one :email_tracking
end
