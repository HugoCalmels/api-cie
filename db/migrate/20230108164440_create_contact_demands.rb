class CreateContactDemands < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_demands do |t|
      t.text :name
      t.text :email
      t.text :subject
      t.timestamps
    end
  end
end
