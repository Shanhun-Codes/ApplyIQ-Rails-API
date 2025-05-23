class AddTagsToJobApplications < ActiveRecord::Migration[8.0]
def change
  add_column :job_applications, :tags, :string, array: true, default: []
end
end
