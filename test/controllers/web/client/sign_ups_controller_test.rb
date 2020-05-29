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
    client_attrs = attributes_for :client
    post client_sign_up_path, params: { client: client_attrs }
    assert_response :redirect

    client = Client.last
    assert_equal client_attrs[:email], client.email
  end
end
