class PhotoTempImageSerializer
  include JSONAPI::Serializer
  attributes :id, :image, :image_url
end
