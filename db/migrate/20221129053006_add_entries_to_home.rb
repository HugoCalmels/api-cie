class AddEntriesToHome < ActiveRecord::Migration[6.1]
  def change
    add_column :homes, :image_url, :text 
  end
end
