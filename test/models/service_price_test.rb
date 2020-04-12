require 'test_helper'

class ServicePriceTest < ActiveSupport::TestCase
  test 'should not create service price, not integer price' do
    service_price = build :service_price, price: 'test123'
    assert_not service_price.save
  end

  test 'should not create with wrong state' do
    service_price = build :service_price, state: 'test'
    assert_not service_price.save
  end

  test 'should deleted service_price' do
    service_price = create :service_price
    service_price.deleted
    service_price.reload
    assert_equal 'deleted', service_price.state
  end

  test 'should craete service_price with service, city, company' do
    service_price = create :service_price
    assert service_price.service
    assert service_price.city
    assert service_price.company
  end
end
