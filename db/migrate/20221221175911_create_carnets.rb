class CreateCarnets < ActiveRecord::Migration[6.1]
  def change
    create_table :carnets do |t|
      t.references :carnet_category, null: false, foreign_key: true
      t.text :image_url
      t.text :title
      t.text :height
      t.text :width
      t.text :material
      t.text :ref
      t.boolean :has_to_be_displayed, default: true 

      t.timestamps
    end
  end
end