require 'test_helper'

class Admin::ClientControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @client = create :client
  end
  test 'should get index clients page' do
    get admin_clients_path
    assert_response :success
  end

  test 'should get new client page' do
    get new_admin_client_path
    assert_response :success
  end

  test 'should create client' do
    client_attrs = attributes_for :client
    post admin_clients_path, params: { client: client_attrs }
    assert_response :redirect

    client = Client.last
    assert_equal client_attrs[:email], client.email
  end

  test 'should not create client' do
    client_attrs = attributes_for :client, email: nil

    post admin_clients_path, params: { client: client_attrs }
    assert_response :success

    client = Client.find_by(email: client_attrs[:email])
    assert_nil client
  end

  test 'should get show client page' do
    client = create :client
    get admin_client_path(client)
    assert_response :success
  end

  test 'should get edit client page' do
    client = create :client

    get edit_admin_client_path(client.id)
    assert_response :success
  end

  test 'should put update client' do
    client = create :client

    attrs = {}
    attrs[:name] = generate :name
    # attrs[:password] = '123456'
    put admin_client_path(client.id), params: { client: attrs }
    assert_response :redirect

    client.reload
    assert_equal attrs[:name], client.name
  end

  test 'should change state to deleted' do
    put admin_client_del_path(@client)
    assert_response :redirect

    @client.reload
    assert_equal @client.state, 'deleted'
  end

  test 'should change state to active' do
    @client.del
    put admin_client_restore_path(@client.id)
    assert_response :redirect

    @client.reload
    assert_equal @client.state, 'active'
  end
end
