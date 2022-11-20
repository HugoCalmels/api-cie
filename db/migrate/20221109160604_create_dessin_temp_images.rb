class CreateDessinTempImages < ActiveRecord::Migration[6.1]
  def change
    create_table :dessin_temp_images do |t|

      t.timestamps
    end
  end
end
