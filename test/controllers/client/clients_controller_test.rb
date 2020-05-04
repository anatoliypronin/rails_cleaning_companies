require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = create :client
    sign_in_as_client(@client)
  end

  test 'should get new client page' do
    get new_client_path
    assert_response :success
  end

  test 'should not get new client page' do
    sign_out_as_client
    get new_client_path
    assert_response :redirect
  end

  test 'should create client' do
    client_attrs = attributes_for :client
    post client_path, params: { client: client_attrs }
    assert_response :redirect

    client = Client.last
    assert_equal client_attrs[:email], client.email
  end

  test 'should not create client' do
    client_attrs = attributes_for :client, email: nil

    post client_path, params: { client: client_attrs }
    assert_response :success

    client = Client.find_by(email: client_attrs[:email])
    assert_nil client
  end

  test 'should get show client page' do
    get client_path
    assert_response :success
  end

  test 'should get edit client page' do
    get edit_client_path
    assert_response :success
  end

  test 'should put update client' do
    attrs = {}
    attrs[:name] = generate :name
    put client_path, params: { client: attrs }
    assert_response :redirect

    @client.reload
    assert_equal attrs[:name], @client.name
  end
end
