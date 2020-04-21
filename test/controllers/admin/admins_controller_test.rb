require 'test_helper'

class Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index admins page' do
    create :admin

    get admin_admins_path
    assert_response :success
  end

  test 'should get new admin page' do
    get new_admin_admin_path
    assert_response :success
  end

  test 'should post create admin' do
    admins_attrs = attributes_for :admin
    post admin_admins_path, params: { admin: admins_attrs }
    assert_response :redirect
    admin = Admin.find_by(email: admins_attrs[:email])
    assert_equal admins_attrs[:email], admin.email
  end

  test 'should get show admin page' do
    admin = create :admin
    get admin_admin_path(admin.id)
    assert_response :success
  end

  test 'should get edit admin page' do
    admin = create :admin
    get edit_admin_admin_path(admin.id)
    assert_response :success
  end

  test 'should put update admin' do
    admin = create :admin
    attrs = {}
    attrs[:name] = generate :name
    put admin_admin_path(admin.id), params: { admin: attrs }
    assert_response :redirect
    admin.reload
    assert_equal attrs[:name], admin.name
  end

  test 'should state deleted  admin' do
    admin = create :admin
    delete admin_admin_path(admin.id)
    assert_response :redirect
    admin.reload
    assert admin.deleted?
  end

  test 'should state active admin' do
    byebug
    admin = create :admin, state: :deleted
    admin.activate!
    assert admin.active?
  end
end
