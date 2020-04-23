class Admin < ApplicationRecord
  extend Enumerize
  validates :name, :email, :role, presence: true
  validates :password, presence: true, on: :create
  validates :name, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  enumerize :role, in: %i[admin editor], default: :admin
  validates :password, length: { minimum: 6 }, on: :create

  has_secure_password validations: false

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
