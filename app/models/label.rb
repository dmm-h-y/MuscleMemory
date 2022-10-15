class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :muscles, through: :labellings
end
