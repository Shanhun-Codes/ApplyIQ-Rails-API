class CreateCoverLetters < ActiveRecord::Migration[8.0]
  def change
    create_table :cover_letters do |t|
      t.text :content
      t.boolean :generated
      t.references :job_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
