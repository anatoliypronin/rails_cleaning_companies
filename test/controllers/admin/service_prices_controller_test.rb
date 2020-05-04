require 'test_helper'

class Admin::ServicePriceControllerTest < ActionDispatch::IntegrationTest

setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @service_price = create :service_price
end

test 'should get index service_prices page' do
    get  admin_service_prices_path
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
    assert_equal service_prices_attrs[:company_id], service_price.company_id
  end

end