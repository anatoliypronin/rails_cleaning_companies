require 'test_helper'

class Admin::CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @company = create :company
  end

  test 'should get index companies page' do
    get admin_companies_path
    assert_response :success
  end

  test 'should get new company page' do
    get new_admin_company_path
    assert_response :success
  end

  test 'should post create company' do
    companies_attrs = attributes_for :company
    post admin_companies_path, params: { company: companies_attrs }
    assert_response :redirect
    company = Company.last
    assert_equal companies_attrs[:email], company.email
  end

  test 'should get show admin page' do
    get admin_company_path(@company)
    assert_response :success
  end

  test 'should get edit company page' do
    get edit_admin_company_path(@company)
    assert_response :success
  end

  test 'should put update admin' do
    attrs = {}
    attrs[:name] = generate :name
    attrs[:password] = '123456'
    put admin_company_path(@company), params: { company: attrs }
    assert_response :redirect
    @company.reload
    assert_equal attrs[:name], @company.name
  end
end
