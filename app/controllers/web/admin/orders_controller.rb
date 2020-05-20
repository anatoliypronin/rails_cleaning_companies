class Web::Admin::OrdersController < Web::Admin::ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order[:price] = ServicePrice.find(orders_params[:service_price_id]).price
    if @order.update(orders_params)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def activate
    order = Order.find(params[:order_id])
    order.activate
    redirect_to action: :index
  end

  def complete
    order = Order.find(params[:order_id])
    order[:date_end] = DateTime.now
    order.complete

    redirect_to action: :index
  end

  def reject
    order = Order.find(params[:order_id])
    order[:date_end] = DateTime.now
    order.reject
    redirect_to action: :index
  end

  private

  def orders_params
    params.require(:order).permit(:service_price_id)
  end
end
