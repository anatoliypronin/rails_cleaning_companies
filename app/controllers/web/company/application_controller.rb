class Web::Company::ApplicationController < Web::ApplicationController
  before_action :authenticate_company!
  helper_method %i[current_company company_sign_in?]
  layout 'company/application'
end
