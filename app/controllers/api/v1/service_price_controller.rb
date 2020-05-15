class Api::V1::ServicePriceController < Api::V1::ApplicationController
  def index
    service_prices = ServicePrice.select('service_prices.id, service_prices.price, services.name as service_name, companies.name as company_name, cities.name as city_name')
                                .joins(:service, :company, :city)
                                .active
                                .where("services.name ILIKE ?", "%#{params[:term]}%")
                                .order('services.name' => :asc)
    render json: service_prices
  end
end
