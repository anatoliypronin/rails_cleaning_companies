class Web::Company::ApplicationController < Web::ApplicationController
  layout 'company/application'
  before_action :authenticate_company!
  helper_method :current_company
end
