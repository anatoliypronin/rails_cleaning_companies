require 'test_helper'

class Web::Client::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = create :client
  end

  test 'should get new sessions page' do
    get new_client_session_path
    assert_response :success
  end

  test 'should post create new session for client' do
    sign_in_as_client(@client)
    assert_response :redirect
    assert_equal session[:client_id], @client.id
  end

  test 'should delete destroy session for client' do
    sign_in_as_client(@client)
    assert_response :redirect

    assert_equal session[:client_id], @client.id

    delete client_session_path
    assert_response :redirect

    assert_nil session[:client_id]
  end
end
