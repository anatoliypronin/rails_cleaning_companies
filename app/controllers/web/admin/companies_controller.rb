class Web::Admin::CompaniesController < Web::Admin::ApplicationController
  def index
    @search = Company.ransack(params[:q])
    @companies = @search.result.page(params[:page])
    authorize current_user, policy_class: AdminPolicy
  end

  def new
    @company = Company.new
    authorize @company, policy_class: AdminPolicy
  end

  def create
    @company = Company.new(companies_attrs)
    authorize current_user, policy_class: AdminPolicy
    if @company.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @company = Company.find(params[:id]).decorate
    authorize current_user, policy_class: ClientPolicy
  end

  def edit
    @company = Company.find(params[:id])
    authorize current_user, policy_class: ClientPolicy
  end

  def update
    @company = Company.find(params[:id])
    authorize current_user, policy_class: ClientPolicy
    if @company.update(companies_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def del
    company = Company.find(params[:company_id])
    authorize current_user, policy_class: AdminPolicy
    company.del
    redirect_to action: :index
  end

  def restore
    company = Company.find(params[:company_id])
    authorize current_user, policy_class: AdminPolicy
    company.activate
    redirect_to action: :index
  end

  private

  def companies_attrs
    params.require(:company).permit(:name, :email, :password, :requisites, :description, :rating, :phone_number,
                                    city_ids: [], service_price_id: [])
  end
end
