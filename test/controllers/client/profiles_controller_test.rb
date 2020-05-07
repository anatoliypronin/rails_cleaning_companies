require 'test_helper'

class Client::ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = create :client
    sign_in_as_client(@client)
  end

  test 'should get show client page' do
    get client_profile_path
    assert_response :success
  end

  test 'should get edit client page' do
    get edit_client_profile_path
    assert_response :success
  end

  test 'should put update client' do
    attrs = {}
    attrs[:name] = generate :name
    put client_profile_path, params: { client: attrs }
    assert_response :redirect

    @client.reload
    assert_equal attrs[:name], @client.name
  end
end
