class AddEntriesToDessins < ActiveRecord::Migration[6.1]
  def change
    add_column :dessins, :title, :text 
    add_column :dessins, :height, :text 
    add_column :dessins, :width, :text 
    add_column :dessins, :material, :text 
    add_column :dessins, :ref, :text 
  end
end
