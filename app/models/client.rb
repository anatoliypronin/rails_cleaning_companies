class Client < ApplicationRecord
  paginates_per 5
  has_many :orders, dependent: :destroy

  validates :name, :email, :phone_number, presence: true
  validates :name, length: { maximum: 30 }
  validates :surname, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  validates :phone_number, phone: true
  validates :password, presence: true, length: { minimum: 5 }, on: :create

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
