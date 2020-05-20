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

  #test 'should get edit order page' do
  #  get edit_admin_order_path(@order)
  #  assert_response :success
  #end
end