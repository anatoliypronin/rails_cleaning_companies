class CompanySignInForm
  include Virtus.model
  include ActiveModel::Model
  include ActiveModel::Validations

  attribute :phone_number, String
  attribute :sms_code, String

  validates :phone_number, presence: true

  def company
    Company.find_by(phone_number: phone_number)
  end
end
