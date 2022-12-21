class CreateCarnetTempImages < ActiveRecord::Migration[6.1]
  def change
    create_table :carnet_temp_images do |t|

      t.timestamps
    end
  end
end
