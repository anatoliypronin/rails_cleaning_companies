require 'test_helper'

class Api::V1::SessionCompanyControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create :company
  end

  test 'should not create session with empty phone' do
    post api_v1_session_company_path
    assert_response :bad_request
    assert_not session[:company_id]
  end

  test 'should not create session for not exist company' do
    options = { company: { phone_number: '99999999999' } }
    post api_v1_session_company_path, params: options
    assert_response :not_found
    assert_not session[:company_id]
  end

  test 'should create sms_code and sent for company' do
    options = { company: { phone_number: @company.phone_number } }
    post api_v1_session_company_path, params: options
    assert_response :success
    assert session[:verification_code]
    assert_equal SmsService::TEST_VERIFICATION_CODE, session[:verification_code]
    assert_not session[:company_id]
  end

  test 'should not create session for company with incorrect code' do
    options = { company: { phone_number: @company.phone_number, sms_code: '0000' } }
    post api_v1_session_company_path, params: options
    assert_response :unprocessable_entity
    assert_not session[:company_id]
  end

  test 'should create session for company with correct code' do
    options = { company: { phone_number: @company.phone_number } }
    post api_v1_session_company_path, params: options
    options = { company: { phone_number: @company.phone_number, sms_code: SmsService::TEST_VERIFICATION_CODE } }
    post api_v1_session_company_path, params: options
    assert_response :success
    assert session[:company_id]
  end
end
