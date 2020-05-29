class Company < ApplicationRecord
  include CompanyRepository
  paginates_per 5

  has_many :company_cities, dependent: :destroy
  has_many :cities, through: :company_cities
  has_many :service_prices, dependent: :destroy
  has_many :orders, through: :service_prices

  validates :name, :email, :requisites, :description,
            presence: true
  validates :password, presence: true, on: :create
  validates :name, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  validates :phone_number, phone: true
  validates :rating, inclusion: 0..5, on: :update

  has_secure_password validations: false

  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition from: :active, to: :deleted, if: :active?
    end

    event :activate do
      transition from: :deleted, to: :active, if: :deleted?
    end
  end
end
