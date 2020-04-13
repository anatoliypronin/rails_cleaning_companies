class City < ApplicationRecord
  has_many :company_cities, dependent: :destroy
  has_many :companies, through: :company_cities
  validates :name, length: 4..60, presence: true
end

