class PaysageCategory < ApplicationRecord
  has_many :paysages, dependent: :destroy
  validates :title, uniqueness: true
end
