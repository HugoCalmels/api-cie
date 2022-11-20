class CreateDessins < ActiveRecord::Migration[6.1]
  def change
    create_table :dessins do |t|
      t.references :dessin_category, null: false, foreign_key: true
      t.text :image_url

      t.timestamps
    end
  end
end
