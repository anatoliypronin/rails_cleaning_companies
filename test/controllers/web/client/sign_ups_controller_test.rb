require 'test_helper'

class Web::Client::SignUpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = create :client
  end

  test 'should get new client sign up page' do
    get new_client_sign_up_path
    assert_response :success
  end

  test 'should post create new client' do
    sign_in_as_client(@client)
    assert_response :redirect
    assert_equal session[:client_id], @client.id
  end
end