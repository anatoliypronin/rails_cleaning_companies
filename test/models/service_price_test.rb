require 'test_helper'

class ServicePriceTest < ActiveSupport::TestCase
  test "should create service_price" do
    assert create :service_price
  end

  test 'should not create service price, not integer price' do
    service_price = build :service_price, price: 'test123'
    service_price.save

    created_service_price = ServicePrice.last
    assert_nil created_service_price
  end
end
