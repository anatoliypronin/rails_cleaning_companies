class Web::ApplicationController < ApplicationController
  layout 'welcome/application'
  helper_method %i[current_client client_sign_in?]
end
