class Web::Admin::ServicePricesController < Web::Admin::ApplicationController
  def index
    @service_prices = ServicePrice.all.page(params[:page])
    authorize current_user, policy_class: AdminPolicy
  end

  def new
    @service_price = ServicePrice.new
    authorize current_user, policy_class: AdminPolicy
  end

  def create
    @service_price = ServicePrice.new(service_prices_attrs)
    authorize current_user, policy_class: AdminPolicy
    if @service_price.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @service_price = ServicePrice.find(params[:id])
    authorize current_user, policy_class: ClientPolicy
  end

  def edit
    @service_price = ServicePrice.find(params[:id])
    authorize current_user, policy_class: ClientPolicy
  end

  def update
    @service_price = ServicePrice.find(params[:id])
    authorize current_user, policy_class: ClientPolicy
    if @service_price.update(service_prices_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def del
    service_price = ServicePrice.find(params[:service_price_id])
    authorize current_user, policy_class: AdminPolicy
    service_price.del
    redirect_to action: :index
  end

  def restore
    service_price = ServicePrice.find(params[:service_price_id])
    authorize current_user, policy_class: AdminPolicy
    service_price.activate
    redirect_to action: :index
  end

  def disable
    service_price = ServicePrice.find(params[:service_price_id])
    authorize current_user, policy_class: AdminPolicy
    service_price.disable
    redirect_to action: :index
  end

  private

  def service_prices_attrs
    params.require(:service_price).permit(:city_id, :company_id, :service_id, :price)
  end
end
