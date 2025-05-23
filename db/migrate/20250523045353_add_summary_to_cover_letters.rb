class AddSummaryToCoverLetters < ActiveRecord::Migration[8.0]
  def change
    add_column :cover_letters, :summary, :text
  end
end
