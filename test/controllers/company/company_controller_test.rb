require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create :company
    sign_in_as_company(@company)
  end

  test 'should get new company page' do
    get new_company_path
    assert_response :success
  end

  test 'should create company' do
    company_attrs = attributes_for :company
    post company_path, params: { company: company_attrs }
    assert_response :redirect

    company = Company.last
    assert_equal company_attrs[:email], company.email
  end

  test 'should get show company page' do
    get company_path
    assert_response :success
  end

  test 'should get edit company page' do
    get edit_company_path
    assert_response :success
  end

  test 'should put update company' do
    attrs = {}
    attrs[:name] = generate :name
    put company_path, params: { company: attrs }
    assert_response :redirect

    @company.reload
    assert_equal attrs[:name], @company.name
  end
end
