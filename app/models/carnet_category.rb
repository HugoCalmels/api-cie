class CarnetCategory < ApplicationRecord
  has_many :carnets, dependent: :destroy
  validates :title, uniqueness: true
end
