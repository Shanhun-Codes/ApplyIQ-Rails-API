class AddFileUrlToCoverLetters < ActiveRecord::Migration[8.0]
  def change
    add_column :cover_letters, :file_url, :string
  end
end
