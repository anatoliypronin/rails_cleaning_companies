class ServicePrice < ApplicationRecord
  belongs_to :service
  belongs_to :city
  belongs_to :company

  validates :price, presence: true, numericality: { only_integer: true }

  state_machine initial: :active do
    state :active
    state :disable
    state :deleted

    event :disabled do
      transition active: :unavailable, deleted: :unavailable
    end

    event :deleted do
      transition unavailable: :deleted, active: :deleted
    end

    event :activated do
      transition deleted: :active, unavailable: :active
    end
  end
end
