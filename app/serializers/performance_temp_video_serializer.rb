class PerformanceTempVideoSerializer
  include JSONAPI::Serializer
  attributes :id, :video, :image_url
end
