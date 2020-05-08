class Web::Company::ProfilesController < Web::Company::ApplicationController

  def show
    @company = current_company.decorate
  end

  def edit
    @company = current_company
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
