class RenameNotesAndAddNoteReferences < ActiveRecord::Migration[5.1]
  def change
    rename_column :status_updates, :notes, :body
    remove_belongs_to :notes, :step, foreign_key: true
    add_belongs_to :notes, :user, foreign_key: true
    add_belongs_to :notes, :team, foreign_key: true
  end
end
