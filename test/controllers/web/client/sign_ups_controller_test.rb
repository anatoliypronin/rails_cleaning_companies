require 'test_helper'

class Web::Client::SignUpsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new client sign up page' do
    get new_client_sign_up_path
    assert_response :success
  end
end