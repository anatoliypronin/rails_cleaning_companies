class Api::V1::ServiceController < Api::V1::ApplicationController
  def show
    companies = Company.select('companies.id, companies.name, service_prices.price').joins(:service_prices).where({ 'service_prices.service_id' => params[:id] })
    render json: companies
  end
end
