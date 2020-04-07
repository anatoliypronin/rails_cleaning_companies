class Company < ApplicationRecord
  validates :name, :email, :password_digest, :requisites, :description,
            presence: true
  validates :name, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  validates :phone_number, phone: true
  validates :rating, inclusion: 1..5
end
