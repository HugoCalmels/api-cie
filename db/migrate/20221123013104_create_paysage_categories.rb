class CreatePaysageCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :paysage_categories do |t|
      t.text :title
      t.timestamps
    end
  end
end
