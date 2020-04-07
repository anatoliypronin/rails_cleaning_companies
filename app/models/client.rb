class Client < ApplicationRecord
  validates :name, :email, :password_digest, :phone_number, presence: true
  validates :name, length: { maximum: 30 }
  validates :surname, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  validates :password_digest, length: { minimum: 5 }
  validates :phone_number, phone: true
end
