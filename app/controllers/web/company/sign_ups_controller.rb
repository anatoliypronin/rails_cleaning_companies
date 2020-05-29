class Web::Company::SignUpsController < Web::Company::ApplicationController
  skip_before_action :authenticate_company!, only: [:new, :create]
  def new; end

  def create
    company = Company.new(companies_attrs)
    if company.save
      company_sign_in(company)
      redirect_to company_profile_path
    else
      render action: :new
    end
  end

  private

  def companies_attrs
    params.require(:company).permit(:name, :email, :password, :requisites, :description, :phone_number,
                                    city_ids: [], service_price_id: [])
  end
end