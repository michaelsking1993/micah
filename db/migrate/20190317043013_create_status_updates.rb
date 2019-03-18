class CreateStatusUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :status_updates do |t|
      t.string :title
      t.text :notes
      t.timestamps
    end
  end
end
