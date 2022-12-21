class PaysageCategory < ApplicationRecord
  has_many :paysages, dependent: :destroy
end
