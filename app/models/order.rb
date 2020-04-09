class Order < ApplicationRecord
  validates :status, :date_start, :date_end, :review, presence: true
  validates :status, inclusion: { in: %w[accepted rejectec pending completed],
                                  message: '%{value} is not status description' }
  validates_datetime :date_start, before: :date_end
  validates_datetime :date_end, after: :date_start
end
