require 'test_helper'

class Admin::ClientControllerTest < ActionDispatch::IntegrationTest
  test 'should get index clients page' do
    create :client

    get admin_clients_path
    assert_response :success
  end

  test 'should get new client page' do
    get new_admin_client
    assert_response :success
  end
end
