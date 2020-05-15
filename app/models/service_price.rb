class ServicePrice < ApplicationRecord
  include ServicePriceRepository

  belongs_to :service
  belongs_to :city
  belongs_to :company
  has_many :order, dependent: :nullify

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  state_machine initial: :active do
    state :active
    state :disabled
    state :deleted

    event :disable do
      transition from: %i[active deleted], to: :disable
    end

    event :del do
      transition from: %i[disabled active], to: :deleted
    end

    event :activate do
      transition from: %i[deleted disabled], to: :active
    end
  end
end
