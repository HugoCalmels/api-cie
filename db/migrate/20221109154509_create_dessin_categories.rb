class CreateDessinCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :dessin_categories do |t|
      t.text :title

      t.timestamps
    end
  end
end
