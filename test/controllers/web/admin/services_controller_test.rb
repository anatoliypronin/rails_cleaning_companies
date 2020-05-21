require 'test_helper'

class Web::Admin::ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @service = create :service
  end

  test 'should get index page' do
    get admin_services_path
    assert_response :success
  end

  test 'should get new services page' do
    get new_admin_service_path
    assert_response :success
  end

  test 'should post create service' do
    services_attrs = attributes_for :service
    post admin_services_path, params: { service: services_attrs }
    assert_response :redirect
    service = Service.last
    assert_equal services_attrs[:name], service.name
  end

  test 'should get show service page' do
    get admin_service_path(@service)
    assert_response :success
  end

  test 'should get edit service page' do
    get edit_admin_service_path(@service)
    assert_response :success
  end

  test 'should update service' do
    attrs = {}
    attrs[:name] = generate :name
    put admin_service_path(@service), params: { service: attrs }
    assert_response :redirect
    @service.reload
    assert_equal attrs[:name], @service.name
  end

  test 'should destroy service' do
    service = create :service
    delete admin_service_path(service.id)
    assert_response :redirect
    assert_not Service.exists?(service.id)
  end

  test 'should not get show service page for editor' do
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    get admin_service_path(@service)
    assert_redirected_to admin_root_path
  end

  test 'should not get edit service page for editor' do
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    get edit_admin_service_path(@service)
    assert_redirected_to admin_root_path
  end

  test 'should not get index service page for editor' do
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    get admin_services_path
    assert_redirected_to admin_root_path
  end

  test 'should not create service by editor' do
    services_attrs = attributes_for :service
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    post admin_services_path, params: { service: services_attrs }
    assert_redirected_to admin_root_path
    service = Service.last
    assert_not_equal services_attrs[:name], service.name
  end

  test 'should not destroy service' do
    service = create :service
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    delete admin_service_path(service.id)
    assert_redirected_to admin_root_path
    assert_equal Service.last, service
  end
end
