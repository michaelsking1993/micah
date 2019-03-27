class ChangeDoThisNowToNow < ActiveRecord::Migration[5.1]
  def change
    rename_column :tasks, :do_this_now, :now
  end
end
