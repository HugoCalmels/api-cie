class AddEntriesToTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :types, :label, :text 
    add_column :types, :desc, :text 
  end
end
