class CreateProgressEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :progress_entries do |t|
      t.text :body
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
