class AddFileUrlToResumes < ActiveRecord::Migration[8.0]
  def change
    add_column :resumes, :file_url, :string
  end
end
