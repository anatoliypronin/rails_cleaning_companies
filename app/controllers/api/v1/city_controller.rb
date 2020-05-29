class Api::V1::CityController < Api::V1::ApplicationController
  def index
    cities = City.all
    render json: cities, each_serializer: CityIndexSerializer
  end
end
