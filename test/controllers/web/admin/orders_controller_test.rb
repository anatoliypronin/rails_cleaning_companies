require 'test_helper'

class Web::Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @order = create :order
  end

  test 'should get index orders page' do
    get admin_orders_path
    assert_response :success
  end

  test 'should get show admin order page' do
    get admin_order_path(@order)
    assert_response :success
  end

  test 'should get edit order page' do
    get edit_admin_order_path(@order)
    assert_response :success
  end

  test 'should put update order' do
    service_price = create :service_price
    orders_params = {}
    orders_params[:service_price_id] = service_price.id
    put admin_order_path(@order), params: { order: orders_params }
    assert_response :redirect
    @order.reload
    assert_equal orders_params[:service_price_id], @order.service_price_id
    assert_equal service_price.price, @order.price
  end

  test 'should state activate order' do
    put admin_order_activate_path(@order)
    assert_response :redirect
    @order.reload
    assert_equal @order.state, 'active'
  end

  test 'should state completed order' do
    order = create :order, :active
    put admin_order_complete_path(order)
    assert_response :redirect
    order.reload
    assert_equal order.state, 'completed'
  end

  test 'should state rejected order' do
    put admin_order_complete_path(@order)
    assert_response :redirect
    @order.reject
    assert_equal @order.state, 'rejected'
  end
end
