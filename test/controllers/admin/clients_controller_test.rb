require 'test_helper'

class Admin::ClientControllerTest < ActionDispatch::IntegrationTest
  test 'should get index clients page' do
    create :client

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
    attrs[:surname] = generate :surname

    put admin_client_path(client.id), params: { client: attrs }
    assert_response :redirect

    client.reload
    assert_equal attrs[:surname], client.surname
  end

  test 'should destroy client' do
    client = create :client

    delete admin_client_path(client.id)
    assert_response :redirect

    assert_not Client.exists?(client.id)
  end
end
