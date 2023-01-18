class CreatePerformanceTempVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :performance_temp_videos do |t|

      t.timestamps
    end
  end
end
