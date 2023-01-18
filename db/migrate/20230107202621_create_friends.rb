class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.text :website_link

      t.text :description
      t.text :title
      t.text :url
      t.text :image
      t.timestamps
    end
  end
end
