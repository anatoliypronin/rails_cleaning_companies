require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create :company
    sign_in_as_company(@company)
  end

  test 'should get show company page' do
    get company_profile_path
    assert_response :success
  end

  test 'should get edit company page' do
    get edit_company_profile_path
    assert_response :success
  end

  test 'should put update company' do
    attrs = {}
    attrs[:name] = generate :name
    put company_profile_path, params: { company: attrs }
    assert_response :redirect

    @company.reload
    assert_equal attrs[:name], @company.name
  end
end
