class RenameFeatureToColumn < ActiveRecord::Migration[5.1]
  def change
    rename_table :features, :tasks
    add_column :tasks, :do_this_now, :boolean
  end
end
