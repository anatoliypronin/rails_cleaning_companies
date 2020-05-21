class Web::Admin::CitiesController < Web::Admin::ApplicationController
  def index
    @cities = City.order(:name).page(params[:page])
    authorize current_admin, policy_class: AdminPolicy
  end

  def new
    @city = City.new
    authorize current_admin, policy_class: AdminPolicy
  end

  def create
    authorize current_admin, policy_class: AdminPolicy
    @city = City.new(city_attrs)
    if @city.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def destroy
    authorize current_admin, policy_class: AdminPolicy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to action: :index
  end

  private

  def city_attrs
    params.require(:city).permit(:name, company_ids: [], service_price_id: [])
  end
end
