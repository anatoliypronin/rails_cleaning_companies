class Web::Client::OrdersController < Web::Client::ApplicationController
  def index
    @orders = Order.where(client_id: current_client.id)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(orders_params)
    @order.client = current_client
    if @order.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(orders_params)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def orders_params
    params.require(:order).permit(:date_start, :date_end, :company_id, :service_id)
  end
end
