class Web::Admin::ApplicationController < Web::ApplicationController
  layout 'admin/application'
  before_action :authenticate_admin!
  helper_method :current_admin
end
