class CarnetCategory < ApplicationRecord
  has_many :carnets, dependent: :destroy
end
