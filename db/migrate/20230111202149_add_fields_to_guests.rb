class AddFieldsToGuests < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :verification_token, :text 
  end
end
