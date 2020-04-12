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
      transition active: :disable, deleted: :disable
    end

    event :del do
      transition disable: :deleted, active: :deleted
    end

    event :activate do
      transition deleted: :active, disable: :active
    end
  end
end
