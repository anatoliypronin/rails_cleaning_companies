class Service < ApplicationRecord
  paginates_per 5
  has_many :service_prices, dependent: :destroy
  validates :name, length: 5..60, presence: true, uniqueness: true
end
