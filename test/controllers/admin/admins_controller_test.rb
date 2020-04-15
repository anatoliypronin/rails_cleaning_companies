require 'test_helper'

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index admins page' do
    create :admin
    
    get admin_admins_path
    assert_response :success
  end
end
