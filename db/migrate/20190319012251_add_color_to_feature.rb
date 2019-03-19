class AddColorToFeature < ActiveRecord::Migration[5.1]
  def change
    add_column :features, :color, :string
  end
end
