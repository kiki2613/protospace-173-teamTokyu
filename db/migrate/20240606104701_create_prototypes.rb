class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.text :image
      t.string :name
      t.string :content
      t.integer :user_id
      t.timestamps
    end
  end
end
