class Web::Admin::ServicePricesController < Web::Admin::ApplicationController
    def index
      @service_prices = ServicePrice.all
    end

    def new
        @service_price = ServicePrice.new
      end
    
    def create
      @service_price = ServicePrice.new(service_prices_attrs)
        if @service_price.save
          redirect_to action: :index
        else
          render action: :new
        end
    end

    def show
      @service_price = ServicePrice.find(params[:id])
    end
  
    def edit
      @service_price = ServicePrice.find(params[:id])
    end
  
    def update
      @service_price = ServicePrice.find(params[:id])
      if @service_price.update(service_prices_attrs)
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    private

    def service_prices_attrs
        params.require(:service_price).permit( :city_id, :company_id , :service_id, :price)
    end
end