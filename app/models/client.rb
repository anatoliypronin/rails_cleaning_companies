class Client < ApplicationRecord
  validates :name, :email, :password_digest, :phonenumber, presence: true
  validates :name, length: { maximum: 30 }
  validates :surname, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  validates :password_digest, length: { minimum: 5 }
  validates :phonenumber, phone: true
end
