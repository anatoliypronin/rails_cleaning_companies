require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'Should create order' do
    order = build :order
    order.save

    created_order = Order.last
    assert created_order
  end

  test "Shouldn't create, date_start is not valid" do
    order = build :order, date_start: 'TEST'
    order.save

    created_order = Order.last
    assert_not created_order
  end

  test "Shouldn't create, date_start is after date_end" do
    order = build :order, date_start: '2019-04-09 15:00:25'
    order.save

    created_order = Order.last
    assert_not created_order
  end

  test "Shouldn't create, status is wrong" do
    order = build :order, status: 'Test'
    order.save

    created_order = Order.last
    assert_not created_order
  end

  test 'Should create, status is right' do
    order = build :order, status: 'rejected'
    order.save

    created_order = Order.last
    assert_not created_order
  end
  test "Shouldn't create, review is > 5 or < 0 " do
    order = build :order, review: 7
    order.save

    created_order = Order.last
    assert_not created_order
  end

  test "Should create, review is right value " do
    order = build :order, review: 2
    order.save

    created_order = Order.last
    assert created_order
  end
  
end
