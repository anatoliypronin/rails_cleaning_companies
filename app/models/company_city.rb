class CompanyCity < ApplicationRecord
  belongs_to :company
  belongs_to :city

  validates :company, uniqueness: { skope: :city }
end
