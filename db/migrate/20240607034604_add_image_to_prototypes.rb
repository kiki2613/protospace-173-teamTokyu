class AddImageToPrototypes < ActiveRecord::Migration[7.0]
  def change
    add_column :prototypes, :image, :text
  end
end
