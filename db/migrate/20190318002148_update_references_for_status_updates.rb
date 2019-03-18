class UpdateReferencesForStatusUpdates < ActiveRecord::Migration[5.1]
  def change
    remove_reference :status_updates, :step, foreign_key: true
    add_reference :status_updates, :feature, foreign_key: true
  end
end
