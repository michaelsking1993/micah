class AddOrderOfImportanceToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :order_of_importance, :integer
    add_column :steps, :order_of_importance, :integer
    add_column :tasks, :order_of_importance, :integer
  end
end
