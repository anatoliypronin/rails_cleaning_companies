class Web::Company::CompaniesController < Web::Company::ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(@company.id)
    else
      render action: :new
    end
  end

  def show
    @company = current_company
  end

  def edit
    @client = current_company
  end

  def update
    @company = current_company

    if @company.update(company_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def company_params
    params.require(:company).permit(:name, :email, :password, :requisites, :description, :rating, :phone_number,
                                    city_ids: [])
  end
end
