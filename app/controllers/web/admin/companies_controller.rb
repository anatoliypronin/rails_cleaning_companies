class Web::Admin::CompaniesController < Web::Admin::ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(companies_attrs)
    if @company.save
      # CompanyMailer.welcome_email(@company).deliver_now
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @company = Company.find(params[:id]).decorate
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(companies_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def del
    company = Company.find(params[:company_id])
    company.del
    redirect_to action: :index
  end

  def restore
    company = Company.find(params[:company_id])
    company.activate
    redirect_to action: :index
  end

  private

  def companies_attrs
    params.require(:company).permit(:name, :email, :password, :requisites, :description, :rating, :phone_number,
                                    city_ids: [], service_price_id: [])
  end
end
