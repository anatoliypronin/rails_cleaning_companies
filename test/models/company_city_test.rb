require 'test_helper'

class CompanyCityTest < ActiveSupport::TestCase
  test 'should be create company_city with company and city' do
    company_city = create :company_city
    assert company_city
  end
end
