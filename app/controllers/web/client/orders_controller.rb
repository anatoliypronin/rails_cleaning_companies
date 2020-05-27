class Web::Client::OrdersController < Web::Client::ApplicationController
  def index
    @orders = current_client.orders.page(params[:page]).decorate
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(orders_params)
    @order.client = current_client
    @order[:date_start] = DateTime.now
    if @order.save
      @order.update(price: ServicePrice.find(orders_params[:service_price_id]).price)
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @order = current_client.orders.find(params[:id]).decorate
  end

  def edit
    @order = current_client.orders.find(params[:id])
  end

  def update
    @order = current_client.orders.find(params[:id])
    if @order.update(orders_params)
      @order.update(price: ServicePrice.find(orders_params[:service_price_id]).price)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def orders_params
    params.require(:order).permit(:service_price_id)
  end
end
