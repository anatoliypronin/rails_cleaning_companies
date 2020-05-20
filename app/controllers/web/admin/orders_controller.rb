class Web::Admin::OrdersController < Web::Admin::ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end
end