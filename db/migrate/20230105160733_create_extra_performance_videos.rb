class CreateExtraPerformanceVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :extra_performance_videos do |t|
      t.string :title
      t.string :video_url
      t.references :performance, null: false, foreign_key: true
      t.timestamps
    end
  end
end
