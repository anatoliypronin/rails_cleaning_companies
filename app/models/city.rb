class City < ApplicationRecord
  validates :name, length: 4..60, presence: true
end

