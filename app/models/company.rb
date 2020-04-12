class Company < ApplicationRecord
  has_many :service_prices, dependent: :restrict_with_error

  validates :name, :email, :password_digest, :requisites, :description,
            presence: true
  validates :name, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  validates :phone_number, phone: true
  validates :rating, inclusion: 0..5
end
