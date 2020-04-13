class Admin < ApplicationRecord
  extend Enumerize
  validates :name, :email, :role, :password_digest, presence: true
  validates :name, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  enumerize :role, in: %i[admin editor], default: :admin
  validates :password_digest, length: { minimum: 6 }

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
