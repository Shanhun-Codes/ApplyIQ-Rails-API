class CreateEmailTrackings < ActiveRecord::Migration[8.0]
  def change
    create_table :email_trackings do |t|
      t.string :thread_id
      t.text :last_email_snippet
      t.datetime :last_updated_from_email
      t.references :job_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
