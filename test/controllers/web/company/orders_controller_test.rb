require 'test_helper'

class Web::Company::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create :company
    sign_in_as_company(@company)
    @order = create :order
  end

  test 'should get index company orders page' do
    get company_orders_path
    assert_response :success
  end

  test 'should get show company order page' do
    get company_order_path(@order)
    assert_response :success
  end
end
