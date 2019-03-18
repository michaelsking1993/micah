class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :title
      t.text :description
      t.boolean :done
      t.timestamps
    end
  end
end
