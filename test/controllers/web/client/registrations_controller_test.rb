require 'test_helper'

class Web::Client::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = create :client
  end

  test 'should get new registration page' do
    get new_client_registration_path
    assert_response :success
  end


end