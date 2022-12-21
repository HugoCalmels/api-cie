class CreateHomeTempImages < ActiveRecord::Migration[6.1]
  def change
    create_table :home_temp_images do |t|

      t.timestamps
    end
  end
end
