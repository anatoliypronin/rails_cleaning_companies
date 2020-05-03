module CompanyRepository
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(state: :active) }
  end
end
