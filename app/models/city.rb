class City < ApplicationRecord
  has_many :service_prices, dependent: :restrict_with_error

  validates :name, length: 4..60, presence: true
end
