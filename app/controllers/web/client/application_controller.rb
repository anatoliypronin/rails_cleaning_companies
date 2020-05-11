class Web::Client::ApplicationController < Web::ApplicationController
  before_action :authenticate_client!
  helper_method %i[current_client client_sign_in?]
  layout 'client/application'
end
