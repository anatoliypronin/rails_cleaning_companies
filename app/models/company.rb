class Company < ApplicationRecord
  validates :name, :email, :password_digest, :requisites, :description,
            presence: true
  validates :name, length: { maximum: 30 }
  validates :email, uniqueness: true, email: true
  validates :phone_number, phone: true
  validates :rating, inclusion: 0..5

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
