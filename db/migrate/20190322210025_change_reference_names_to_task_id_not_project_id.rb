class ChangeReferenceNamesToTaskIdNotProjectId < ActiveRecord::Migration[5.1]
  def change
    rename_column :steps, :feature_id, :task_id
    rename_column :status_updates, :feature_id, :task_id
  end
end
