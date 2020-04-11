class ServicePrice < ApplicationRecord
  validates :price, presence: true, numericality: { only_integer: true }

  state_machine initial: :active do
    state :active
    state :unavailable
    state :deleted

    event :to_unavailable do
      transition active: :unavailable, deleted: :unavailable
    end

    event :to_deleted do
      transition unavailable: :deleted, active: :deleted
    end

    event :to_active do
      transition deleted: :active, unavailable: :active
    end
  end
end
