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
end
