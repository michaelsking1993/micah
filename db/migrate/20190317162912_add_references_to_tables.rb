class AddReferencesToTables < ActiveRecord::Migration[5.1]
  def change
    add_reference :projects, :user, foreign_key: true
    add_reference :features, :project, foreign_key: true
    add_reference :steps, :feature, foreign_key: true
    add_reference :status_updates, :step, foreign_key: true
    add_reference :notes, :step, foreign_key: true
  end
end
