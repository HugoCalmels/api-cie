class CreatePhotoCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_categories do |t|
      t.text :title
      t.timestamps
    end
  end
end
