class RenameFileToFileUrlInResumes < ActiveRecord::Migration[8.0]
  def change
    rename_column :resumes, :file, :file_url
  end
end
