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

  private

  def orders_params
    params.require(:order).permit(:service_price_id)
  end
end
