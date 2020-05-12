require 'test_helper'

class Web::Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
  end
  test 'should get new sessions page' do
    get new_admin_session_path
    assert_response :success
  end

  test 'should post create new session for admin' do
    sign_in_as_admin(@admin)
    assert_response :redirect
    assert_equal session[:admin_id], @admin.id
  end

  test 'should delete destroy session for admin' do
    sign_in_as_admin(@admin)
    assert_response :redirect

    assert_equal session[:admin_id], @admin.id

    delete admin_session_path
    assert_response :redirect

    assert_nil session[:admin_id]
  end
end
