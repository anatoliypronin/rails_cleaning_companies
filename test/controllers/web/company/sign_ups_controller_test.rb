require 'test_helper'

class Web::Company::SignUpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create :company
  end

  test 'should get new company sign up page' do
    get new_company_sign_up_path
    assert_response :success
  end

  test 'should post create new company' do
    companies_attrs = attributes_for :company
    post company_sign_up_path, params: { company: companies_attrs }
    assert_response :redirect

    company = Company.last
    assert_equal companies_attrs[:email], company.email
  end
end
