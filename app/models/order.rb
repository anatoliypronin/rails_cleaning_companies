class Order < ApplicationRecord
  validates :status, :date_start, :date_end, :review, presence: true
  validates :status, inclusion: { in: %w[accepted rejectec pending completed],
                                  message: '%{value} is not status description' }
  validates :review, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 5.0 }
  validates_datetime :date_start, before: :date_end
  validates_datetime :date_end, after: :date_start

end
