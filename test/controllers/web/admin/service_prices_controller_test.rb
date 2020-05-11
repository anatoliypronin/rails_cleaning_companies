require 'test_helper'

class Web::Admin::ServicePriceControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @service_price = create :service_price
  end

  test 'should get index service_prices page' do
    get admin_service_prices_path
    assert_response :success
  end

  test 'should post create service_prices' do
    @city = create :city
    @company = create :company
    @service = create :service
    service_prices_attrs = attributes_for :service_price
    service_prices_attrs[:city_id] = @city.id
    service_prices_attrs[:company_id] = @company.id
    service_prices_attrs[:service_id] = @service.id
    post admin_service_prices_path, params: { service_price: service_prices_attrs }
    assert_response :redirect
    service_price = ServicePrice.last
    assert_equal service_price.city, @city
    assert_equal service_price.service, @service
    assert_equal service_price.company, @company
  end

  test 'should get show service_price page' do
    get admin_service_price_path(@service_price)
    assert_response :success
  end

  test 'should get edit service_price page' do
    get edit_admin_service_price_path(@service_price)
    assert_response :success
  end

  test 'should put update service_price' do
    attrs = {}
    attrs[:price] = generate :price
    put admin_service_price_path(@service_price), params: { service_price: attrs }
    assert_response :redirect
    @service_price.reload
    assert_equal attrs[:price], @service_price.price
  end

  test 'should state deleted service_price' do
    put admin_service_price_del_path(@service_price)
    assert_response :redirect
    @service_price.reload
    assert_equal @service_price.state, 'deleted'
  end

  test 'should state disable service_price' do
    put admin_service_price_disable_path(@service_price)
    assert_response :redirect
    @service_price.reload
    assert_equal @service_price.state, 'disable'
  end

  test 'should state active service_price' do
    @service_price = create :service_price, :disabled
    put admin_service_price_restore_path(@service_price)
    assert_response :redirect
    @service_price.reload
    assert_equal @service_price.state, 'active'
  end
end
