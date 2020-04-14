class City < ApplicationRecord
  has_many :company_cities, dependent: :destroy
  has_many :companies, through: :company_cities
  has_many :service_prices, dependent: :destroy

  validates :name, length: 4..60, presence: true
end
