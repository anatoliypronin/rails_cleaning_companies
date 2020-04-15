class Order < ApplicationRecord
  belongs_to :company
  belongs_to :client
  belongs_to :service 

  validates :date_start, :date_end, :review, presence: true
  validates :review, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }
  validates_datetime :date_start, before: :date_end
  validates_datetime :date_end, after: :date_start

  state_machine initial: :pending do
    state :active
    state :rejected
    state :pending
    state :completed

    event :activate do
      transition pending: :active
    end
    
    event :reject do
      transition pending: :rejected
    end 

    event :complete do
      transition accepted: :completed
    end 
  end
end
