require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'Should create order' do
    order = create :order
    assert order.service_price
  end

  test "Shouldn't create, date_start is not valid" do
    order = build :order, date_start: 'TEST'
    order.save

    created_order = Order.last
    assert_not created_order
  end

  test "Shouldn't create, review is > 5 or < 0 " do
    order = build :order, review: 7.0
    order.save

    created_order = Order.last
    assert_not created_order
  end
end
