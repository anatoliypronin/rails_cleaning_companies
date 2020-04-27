require 'test_helper'

class  Admin::ServicesControllerTest < ActionDispatch::IntegrationTest
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
end
