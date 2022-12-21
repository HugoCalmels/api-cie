class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
