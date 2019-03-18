class AddColumnsToUserForAuthentication < ActiveRecord::Migration[5.1]
  def change
    remove_reference :projects, :user, foreign_key: true
    drop_table :users
  end
end
