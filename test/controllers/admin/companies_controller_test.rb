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

  test 'should put update company' do
    attrs = {}
    attrs[:name] = generate :name
    put admin_company_path(@company), params: { company: attrs }
    assert_response :redirect
    @company.reload
    assert_equal attrs[:name], @company.name
  end

  test 'should state deleted  company' do
    put admin_company_del_path(@company)
    assert_response :redirect
    @company.reload
    assert_equal @company.state, 'deleted'
  end

  test 'should state active company' do
    @company = create :company, :del
    put admin_company_restore_path(@company.id)
    assert_response :redirect
    @company.reload
    assert_equal @company.state, 'active'
  end

  test 'should update company with city' do
    @city = create :city
    attrs_company = attributes_for :company
    attrs_company[:city_ids] = [@city.id]
    put admin_company_path(@company), params: { company: attrs_company }
    assert @company.cities.include?(@city)
  end

  test 'should get company by company name' do
    get admin_companies_path, params: { q: { name_cont: @company.name } }
    assert_select 'tr.bg-success'
  end

  test 'should not get company by company name' do
    get admin_companies_path, params: { q: { name_cont: 'foo' } }
    assert_select 'tr.bg-success', false
  end

  test 'should get company by city name' do
    city = create :city
    attrs_company = attributes_for :company
    attrs_company[:city_ids] = [city.id]
    put admin_company_path(@company), params: { company: attrs_company }
    get admin_companies_path, params: { q: { cities_name_cont: city.name } }
    assert_select 'tr.bg-success'
  end

  test 'should not get company by city name' do
    city = create :city
    attrs_company = attributes_for :company
    attrs_company[:city_ids] = [city.id]
    put admin_company_path(@company), params: { company: attrs_company }
    get admin_companies_path, params: { q: { cities_name_cont: 'foo' } }
    assert_select 'tr.bg-success', false
  end
end
