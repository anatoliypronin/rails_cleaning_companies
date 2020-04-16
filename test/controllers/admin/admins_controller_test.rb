require 'test_helper'

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index admins page' do
    create :admin

    get admin_admins_path
    assert_response :success
  end

  test 'should get new admins page' do
    get new_admin_admin_path
    assert_response :success
  end
end
