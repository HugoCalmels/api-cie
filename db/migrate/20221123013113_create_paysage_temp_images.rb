class CreatePaysageTempImages < ActiveRecord::Migration[6.1]
  def change
    create_table :paysage_temp_images do |t|

      t.timestamps
    end
  end
end
