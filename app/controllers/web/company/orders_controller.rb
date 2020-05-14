class Web::Company::OrdersController < Web::Company::ApplicationController
    def index
        @orders = Order.where(company_id: current_company.id)
    end

    def show
        @order = current_company.orders.find(params[:id]) rescue not_found
    end

    def activate
        order = Order.find(params[:order_id])
        order.activate
        redirect_to action: :index
    end

    def complete
        order = Order.find(params[:order_id])
        order.complete
        redirect_to action: :index
    end

    def reject
        order = Order.find(params[:order_id])
        order.reject
        redirect_to action: :index
    end

    private 

    def order_params
        params.require(:order).permit(:data_start, :data_end, :review, :client_id, :company_id, :service_id)
    end
end
