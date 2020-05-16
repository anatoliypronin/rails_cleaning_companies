class Web::Company::OrdersController < Web::Company::ApplicationController
  def index
    @orders = current_company.orders
  end

  def show
    @order = current_company.orders.find(params[:id])
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

  def order_params
    params.require(:order).permit(:data_start, :data_end, :review, :client_id, :service_price)
  end
end
