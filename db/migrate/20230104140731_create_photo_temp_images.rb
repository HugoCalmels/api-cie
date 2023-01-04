class CreatePhotoTempImages < ActiveRecord::Migration[6.1]
  def change
    create_table :photo_temp_images do |t|

      t.timestamps
    end
  end
end
