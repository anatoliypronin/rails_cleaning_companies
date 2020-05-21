class Web::Admin::ServicesController < Web::Admin::ApplicationController
  def index
    @services = Service.all
    authorize current_user, policy_class: AdminPolicy
  end

  def new
    @service = Service.new
    authorize current_user, policy_class: AdminPolicy
  end

  def create
    @service = Service.new(service_attrs)
    authorize current_user, policy_class: AdminPolicy
    if @service.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @service = Service.find(params[:id])
    authorize current_user, policy_class: ClientPolicy
  end

  def edit
    @service = Service.find(params[:id])
    authorize current_user, policy_class: ClientPolicy
  end

  def update
    @service = Service.find(params[:id])
    authorize current_user, policy_class: ClientPolicy
    if @service.update(service_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    authorize current_user, policy_class: AdminPolicy
    service = Service.find(params[:id])
    service.destroy

    redirect_to action: :index
  end

  private

  def service_attrs
    params.require(:service).permit(:name, service_price_id: [])
  end
end
