class CompanyDecorator < ApplicationDecorator
  def phone_and_email
    object.phone_number + ' ' + object.email
  end
end
