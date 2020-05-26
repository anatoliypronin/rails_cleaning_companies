require 'test_helper'

class Web::Client::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new client registration page' do
    get new_client_registration_path
    assert_response :success
  end


end