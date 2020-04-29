class Admin::CitiesController < Admin::ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_attrs)

    if @city.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to action: :index
  end

  private

  def city_attrs
    params.require(:city).permit(:name, company_ids: [])
  end
end
