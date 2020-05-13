class Api::V1::ServiceController < Api::V1::ApplicationController
  def show
    service = Service.find(params[:id])
    render json: service, serializer: ServiceShowSerializer
  end
end
