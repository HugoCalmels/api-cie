class Performance < ApplicationRecord
  has_many :extra_performance_videos, dependent: :destroy
end
