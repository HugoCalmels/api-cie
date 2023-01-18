class CreateThumbnailPreviews < ActiveRecord::Migration[6.1]
  def change
    create_table :thumbnail_previews do |t|

      t.timestamps
    end
  end
end
