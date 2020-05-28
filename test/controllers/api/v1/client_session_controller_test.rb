require 'test_helper'

class Api::V1::ClientSessionControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = create :client
  end

  test 'should not create session with empty phone' do
    post api_v1_client_session_path
    assert_response :bad_request
  end

  test 'should not create session for not exist client' do
    options = { client: { phone_number: '00000000000' } }
    post api_v1_client_session_path, params: options
    assert_response :not_found

    assert_not session[:client_id]
  end

  test 'should create sms_code and sent for client' do
    options = { client: { phone_number: @client.phone_number } }
    post api_v1_client_session_path, params: options
    assert_response :success

    assert session[:verification_code]
    assert_equal SmsService::TEST_VERIFICATION_CODE, session[:verification_code]
    assert_not session[:client_id]
  end

  test 'should not create session for client with incorrect code' do
    options = { client: { phone_number: @client.phone_number, sms_code: '0000' } }
    post api_v1_client_session_path, params: options
    assert_response :unprocessable_entity

    assert_not session[:client_id]
  end

  test 'should create session for client' do
    options = { client: { phone_number: @client.phone_number } }
    post api_v1_client_session_path, params: options

    options = { client: { phone_number: @client.phone_number, sms_code: SmsService::TEST_VERIFICATION_CODE } }
    post api_v1_client_session_path, params: options
    assert_response :success

    assert session[:client_id]
  end
end
