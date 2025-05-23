class AddProfessionToResumes < ActiveRecord::Migration[8.0]
  def change
    add_column :resumes, :profession, :string
  end
end
