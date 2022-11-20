class DessinCategory < ApplicationRecord
  has_many :dessins, dependent: :destroy
end
