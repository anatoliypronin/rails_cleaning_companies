require 'test_helper'

class Web::Admin::ClientControllerTest < ActionDispatch::IntegrationTest
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

  test 'should not get show client page for editor' do
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    get admin_client_path(@client)
    assert_redirected_to admin_root_path
  end

  test 'should not get edit client page for editor' do
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    get edit_admin_client_path(@client.id)
    assert_redirected_to admin_root_path
  end

  test 'should not get index clients page for editor' do
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    get admin_clients_path
    assert_redirected_to admin_root_path
  end

  test 'should not create client by editor' do
    client_attrs = attributes_for :client
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    post admin_clients_path, params: { client: client_attrs }
    assert_redirected_to admin_root_path
    client = Client.last
    assert_not_equal client_attrs[:email], client.email
  end

  test 'should not change state to deleted by editor' do
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    put admin_client_del_path(@client)
    assert_redirected_to admin_root_path
    @client.reload
    assert_equal @client.state, 'active'
  end
end
