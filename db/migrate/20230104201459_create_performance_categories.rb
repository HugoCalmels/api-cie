class CreatePerformanceCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :performance_categories do |t|
      t.text :title
      t.text :released_date
      t.timestamps
    end
  end
end
