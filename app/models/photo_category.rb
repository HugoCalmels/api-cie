class PhotoCategory < ApplicationRecord
  has_many :photos, dependent: :destroy
  validates :title, uniqueness: true
end
