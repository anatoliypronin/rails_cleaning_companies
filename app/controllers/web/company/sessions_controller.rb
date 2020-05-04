class Web::Company::SessionsController < Web::Company::ApplicationController
  skip_before_action :authenticate_company!
  def new; end

  def create
    company = Company.find_by(email: params[:company][:email])
    if company&.authenticate(params[:company][:password])
      company_sign_in(company)
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    company_sign_out
    redirect_to new_session_path
  end
end
