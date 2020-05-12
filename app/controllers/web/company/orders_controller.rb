class Web::Company::OrdersController < Web::Company::ApplicationController
    def index
        @orders = Order.where(company_id: current_company.id)
    end

    def show
        @orders = Order.where(company_id: current_company.id)
    end
end
