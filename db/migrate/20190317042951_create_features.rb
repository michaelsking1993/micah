class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :title
      t.text :description
      t.boolean :done

      t.timestamps
    end
  end
end
