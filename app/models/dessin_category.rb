class DessinCategory < ApplicationRecord
  has_many :dessins, dependent: :destroy
  validates :title, uniqueness: true
end
