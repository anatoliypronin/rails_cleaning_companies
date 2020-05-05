class ServicePrice < ApplicationRecord
  belongs_to :service
  belongs_to :city
  belongs_to :company

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  state_machine initial: :active do
    state :active
    state :disable
    state :deleted

    event :disable do
      transition from: [:active, :deleted], to: :disable
    end

    event :del do
      transition from: [:disable, :active], to: :deleted
    end

    event :activate do
      transition from: [:deleted, :disable], to: :active
    end
  end
end
