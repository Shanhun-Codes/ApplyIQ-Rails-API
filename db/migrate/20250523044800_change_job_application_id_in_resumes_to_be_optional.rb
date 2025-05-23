class ChangeJobApplicationIdInResumesToBeOptional < ActiveRecord::Migration[8.0]
  def change
    change_column_null :resumes, :job_application_id, true
  end
end
