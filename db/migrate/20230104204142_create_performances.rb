class CreatePerformances < ActiveRecord::Migration[6.1]
  def change
    create_table :performances do |t|
      #t.references :performance_category, null: false, foreign_key: true
      t.text :video_url
      t.text :title
      t.text :desc
      t.text :featuring
      t.text :website_link
      t.timestamps
    end
  end
end