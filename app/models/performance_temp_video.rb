class PerformanceTempVideo < ApplicationRecord
  has_one_attached :video

  def image_url
    Rails.application.routes.url_helpers.url_for(video) if video.attached?
  end
end
