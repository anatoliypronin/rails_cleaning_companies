require 'test_helper'

class ServicePriceTest < ActiveSupport::TestCase
  test 'should create service_price' do
    assert create :service_price
  end

  test 'should not create service price, not integer price' do
    service_price = build :service_price, price: 'test123'
    assert_not service_price.save
  end

  test 'should not create with wrong state' do
    service_price = build :service_price, state: 'test'
    assert_not service_price.save
  end
end
