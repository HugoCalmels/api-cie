class PhotoCategory < ApplicationRecord
  has_many :photos, dependent: :destroy
end
