class AddToneToCoverLetters < ActiveRecord::Migration[8.0]
  def change
    add_column :cover_letters, :tone, :string
  end
end
