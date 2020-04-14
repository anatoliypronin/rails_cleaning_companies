class Service < ApplicationRecord
  has_many :service_prices, dependent: :destroy

  validates :name, length: 5..60, presence: true
end
