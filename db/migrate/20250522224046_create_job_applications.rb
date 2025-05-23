class CreateJobApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :job_applications do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :source
      t.string :url
      t.date :date_applied
      t.string :status
      t.text :notes
      t.string :job_type
      t.text :job_description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
