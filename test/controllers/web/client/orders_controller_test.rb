require 'test_helper'

class Web::Client::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = create :client
    @order = create :order, client: @client
    sign_in_as_client(@client)
  end

  test 'should get index orders page' do
    get client_orders_path
    assert_response :success
  end

  test 'should get show order page' do
    get client_order_path(@order)
    assert_response :success
  end

  test 'should get new order page' do
    get new_client_order_path
    assert_response :success
  end

  test 'should create order' do
    service_price = create :service_price
    order_attrs = attributes_for :order
    order_attrs[:service_price_id] = service_price[:id]
    post client_orders_path, params: { order: order_attrs }
    assert_response :redirect

    order = Order.last
    assert_equal order_attrs[:service_price_id], order.service_price_id
    assert_equal service_price.price, order.price
  end

  test 'should get edit order page' do
    get edit_client_order_path(@order)
    assert_response :success
  end

  test 'should put update order' do
    service_price = create :service_price
    order_attrs = {}
    order_attrs[:service_price_id] = service_price.id
    put client_order_path(@order), params: { order: order_attrs }
    assert_response :redirect

    @order.reload
    assert_equal order_attrs[:service_price_id], @order.service_price_id
    assert_equal service_price.price, @order.price
  end
end
