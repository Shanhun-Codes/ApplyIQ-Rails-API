class CreateAiInsights < ActiveRecord::Migration[8.0]
  def change
    create_table :ai_insights do |t|
      t.integer :match_score
      t.text :suggested_skills
      t.text :tone_suggestions
      t.references :job_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
