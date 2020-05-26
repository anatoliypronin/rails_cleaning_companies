class Api::V1::ServiceController < Api::V1::ApplicationController
  def index
    services = Service.all.order(created_at: :asc)
    render json: services, each_serializer: ServiceIndexSerializer
  end
end
