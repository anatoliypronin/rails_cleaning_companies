class Api::V1::CompanyController < Api::V1::ApplicationController
  def index
    company = Company.active.order(rating: :desc)
    render json: company, each_serializer: CompanyIndexSerializer
  end

  def show
    company = Company.find(params[:id])
    render json: company, serializer: CompanyShowSerializer
  end
end
