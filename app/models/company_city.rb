class CompanyCity < ApplicationRecord
  belongs_to :company
  belongs_to :city
  # with this validation can't update company with many city
  #  validates :company, uniqueness: { sсope: :city }
end
