class Order < ApplicationRecord
  paginates_per 1
  belongs_to :service_price
  belongs_to :client

  validates :date_start, :review, :price, presence: true
  validates :review, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }

  state_machine initial: :pending do
    state :active
    state :rejected do
      validates :date_end, presence: true
    end
    state :pending
    state :completed do
      validates :date_end, presence: true
    end

    event :activate do
      transition pending: :active
    end

    event :reject do
      transition pending: :rejected
    end

    event :complete do
      transition active: :completed
    end
  end
end
