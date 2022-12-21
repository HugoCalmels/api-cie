class CreateCarnetCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :carnet_categories do |t|
      t.text :title
      t.timestamps
    end
  end
end
