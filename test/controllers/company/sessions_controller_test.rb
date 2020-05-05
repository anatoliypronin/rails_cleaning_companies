require 'test_helper'

class Company::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create :company
  end
  test 'should get new sessions page' do
    get new_session_path
    assert_response :success
  end

  test 'should post create new session for company' do
    sign_in_as_company(@company)
    assert_response :redirect
    assert_equal session[:company_id], @company.id
  end

  test 'should delete destroy session for company' do
    sign_in_as_company(@company)
    assert_response :redirect

    assert_equal session[:company_id], @company.id

    delete session_path
    assert_response :redirect

    assert_nil session[:company_id]
  end
end
