require 'test_helper'

class Web::Company::SignUpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create :company
  end

  test 'should get new company sign up page' do
    #byebug
    get new_company_sign_up_path
    assert_response :success
  end

  test 'should post create new company' do
    byebug
    sign_in_as_company(@company)
    assert_response :redirect
    assert_equal session[:company_id], @company.id
  end
end