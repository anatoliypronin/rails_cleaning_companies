class Web::Company::OrdersController < Web::Company::ApplicationController
  def index
    @orders = Order.includes(:service_price).where(service_prices: { company_id: current_company.id })
  end

  def show
    @order = current_company.orders.find(params[:id])
  end

  def activate
    order = current_company.orders.find(params[:order_id])
    order.activate
    redirect_to action: :index
  end

  def complete
    order = current_company.orders.find(params[:order_id])
    order[:date_end] = DateTime.now
    order.complete

    redirect_to action: :index
  end

  def reject
    order = current_company.orders.find(params[:order_id])
    order[:date_end] = DateTime.now
    order.reject
    redirect_to action: :index
  end
end
