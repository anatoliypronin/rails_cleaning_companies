class Web::Company::OrdersController < Web::Company::ApplicationController
    def index
        @orders = Order.where(company_id: current_company.id)
    end

    def show
        @order = current_company.orders.find(params[:id])
    end

    private 

    def order_params
        params.require(:order).permit(:data_start, :data_end, :review, client_id: [], company_id: [], service_id:[])
    end
end
