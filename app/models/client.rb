class Client < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, :email, :password_digest, :phone_number, presence: true
  validates :name, length: { maximum: 30 }
  validates :surname, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  validates :phone_number, phone: true
  validates :password, length: { minimum: 5 }

  has_secure_password

  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition active: :deleted
    end

    event :activate do
      transition deleted: :active
    end
  end
end
