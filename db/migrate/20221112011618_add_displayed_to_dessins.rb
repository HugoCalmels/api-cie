class AddDisplayedToDessins < ActiveRecord::Migration[6.1]
  def change
    add_column :dessins, :has_to_be_displayed, :boolean, default: true 
  end
end
