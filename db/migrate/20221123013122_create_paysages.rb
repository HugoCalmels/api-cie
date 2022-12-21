class CreatePaysages < ActiveRecord::Migration[6.1]
  def change
    create_table :paysages do |t|
      t.references :paysage_category, null: false, foreign_key: true
      t.text :image_url
      t.timestamps
    end
  end
end
