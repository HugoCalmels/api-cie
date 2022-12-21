class AddEntriesToPaysages < ActiveRecord::Migration[6.1]
  def change
    add_column :paysages, :title, :text 
    add_column :paysages, :height, :text 
    add_column :paysages, :width, :text 
    add_column :paysages, :material, :text 
    add_column :paysages, :ref, :text 
    add_column :paysages, :has_to_be_displayed, :boolean, default: true 
  end
end
