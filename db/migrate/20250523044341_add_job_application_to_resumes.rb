class AddJobApplicationToResumes < ActiveRecord::Migration[8.0]
  def change
    add_reference :resumes, :job_application, null: false, foreign_key: true
  end
end
