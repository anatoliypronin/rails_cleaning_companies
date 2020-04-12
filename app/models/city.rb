class City < ApplicationRecord
  has_many :service_prices, dependent: :destroy

  validates :name, length: 4..60, presence: true
end
